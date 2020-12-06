//
//  PitchDetection.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/10/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class PitchDetection{
    
    let defaults = UserDefaults.standard
    
    static let shared = PitchDetection()
    
    private var subscriberArray = [Subscriber]()
    
    func addSubscriber(subscriber : Subscriber){
        subscriberArray.append(subscriber)
    }
    
    private func notify(){
        for each in subscriberArray{
            each.update()
        }
    }
    
    let Notes = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    
    // Pitch Calculation Logic
    var timer = Timer()
    var noiseGateThreshold: Double = 0.05
    let timerCycle:Double = 0.05
    let frequencyError:Double = 1 // the room for error on the frequency calculations
    
    // Microphone setup
    private var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    
    // Debug Labels
    var pitchDetectionLabel: String!
    var frequencyDebugLabel: String!
    var amplitudeDebugLabel: String!
    
    // Pub-Sub Label
    var pitchLabel:String!
    
    func initializePitchDetection(){
        AKSettings.audioInputEnabled = true
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
    }
    
    func determineNoiseGate(){
        
        print(UserDefaults.standard.integer(forKey: "NoiseGate"))
        
        if (UserDefaults.standard.integer(forKey: "NoiseGate") == 0) {
            defaults.set(1, forKey: "NoiseGate")
        } else {
            if(defaults.integer(forKey: "NoiseGate") == 1){
                noiseGateThreshold = 0.01
            }else if(defaults.integer(forKey: "NoiseGate") == 2){
                noiseGateThreshold = 0.025
            }else if(defaults.integer(forKey: "NoiseGate") == 3){
                noiseGateThreshold = 0.05
            }else if(defaults.integer(forKey: "NoiseGate") == 4){
                noiseGateThreshold = 0.075
            }else{
                print("that's tough...")
            }
        }
    }
    
    func setupPitchDetection(){
        determineNoiseGate()
        AKManager.output = silence
        do {
            try AKManager.start()
            self.calculatePitchDetection()
            Timer.scheduledTimer(withTimeInterval: self.timerCycle, repeats: true) { timer in // Timer executes every 1/10 of a second
                if(self.tracker.amplitude > self.noiseGateThreshold){ // The amplitude is the loudness of the noise. Therefore, if the loudness of the noise in the microphone is greater than the given threshold then the microphone will pick it up. (noise gate)
                    self.calculatePitchDetection()
                }else{
                    self.amplitudeDebugLabel = "amplitude: 0.00"
                }
            }
        } catch {
            AKLog("AudioKit did not start!")
        }
    }
    
    func calculatePitchDetection(){
        frequencyDebugLabel = "frequency: " + String(tracker.frequency)
        amplitudeDebugLabel = "amplitude: " + String(tracker.amplitude)
        
        // Calculate the octave of the note
        var noteOctaveLowerBound: [Double] = []
        var noteOctaveUpperBound: [Double] = []
        var octave: Int = 0
        
        // Calculte the intervales the note frequencies can be in.
        for i in 0...8{
            noteOctaveLowerBound.append(16.25 * pow(2.0,Double(i)))
            noteOctaveUpperBound.append(30.87 * pow(2.0,Double(i)))
        }
        
        // Calculates what octave the note is on
        for i in 0...8 {
            if(tracker.frequency >= noteOctaveLowerBound[i] && tracker.frequency <= noteOctaveUpperBound[i]){
                octave = i
            }
        }
        
        // Get middle A of the octave we are on
        let middleA = 440 * pow(2, (octave - 5))
        
        // Calculate the frequency from middleA
        var octaveFrequencies: [Double] = []
        for i in 3...14{ // Start at 3 because its easier to work with the chart im using. This way it starts at C and ends at B
            let middleACalculation = middleA * pow(2, i / 12)
            octaveFrequencies.append(middleACalculation) // Adds all the frequencies in that octave to the array
        }
        
        // Find the closest value in the octaveFrequencies array. (auto tune / pitch correction between the set invervals above)
        var smallestValue:Double = 0
        var biggestValue:Double = 10000
        for each in octaveFrequencies{
            if(tracker.frequency >= each && each > smallestValue){
                smallestValue = each
            }
            if(tracker.frequency <= each && each < biggestValue){
                biggestValue = each
            }
        }
        var closest:Double = 0
        let closestBig = abs(biggestValue - tracker.frequency)
        let closestSmall = abs(smallestValue - tracker.frequency)
        if(closestBig < closestSmall){
            closest = biggestValue
        }else{
            closest = smallestValue
        }
        
        // Get the index of the closest value
        let index = octaveFrequencies.firstIndex(of: closest)
        pitchLabel = Notes[index ?? 0]
        
        // Pub-Sub notify
        notify()
        
    }
    
    func setLabel(newLabel: String){
        pitchDetectionLabel = newLabel
        
        // Pub-Sub notify
        notify()
    }
}
