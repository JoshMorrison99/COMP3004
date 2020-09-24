//
//  PitchDetection.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 9/24/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class PitchDetection: UIViewController {
    
    @IBOutlet weak var pitchDetectionLabel: UILabel!
    @IBOutlet weak var frequencyDebugLabel: UILabel!
    @IBOutlet weak var amplitudeDebugLabel: UILabel!
    
    let Notes = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    
    var timer = Timer()
    let noiseGateThreshold: Double = 0.1 // The threshold to determine at what loudness the microphone will begin picking up sound
    let timerCycle:Double = 0.05 // the amount of time between each time the function to determinePitch() is called
    let frequencyError:Double = 1 // the room for error on the frequency calculations

    var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!


    override func viewDidLoad() {
        super.viewDidLoad()

        AKSettings.audioInputEnabled = true
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

            AKManager.output = silence
            do {
                try AKManager.start()
                pitchDetection()
                Timer.scheduledTimer(withTimeInterval: self.timerCycle, repeats: true) { timer in // Timer executes every 1/10 of a second
                    if(self.tracker.amplitude > self.noiseGateThreshold){ // The amplitude is the loudness of the noise. Therefore, if th eloudness of the noise in the microphone is greater than the given threshold then the microphone will pick it up. (noise gate)
                        self.pitchDetection()
                    }else{
                        self.amplitudeDebugLabel.text = "amplitude: 0.00"
                    }
                }
            } catch {
                AKLog("AudioKit did not start!")
            }
        }

    func pitchDetection(){
        frequencyDebugLabel.text = "frequency: " + String(tracker.frequency)
        amplitudeDebugLabel.text = "amplitude: " + String(tracker.amplitude)
        
        // Calculate the octave of the note
        var noteOctaveLowerBound: [Double] = []
        var noteOctaveUpperBound: [Double] = []
        var octave: Int = 0
        for i in 0...8{
            noteOctaveLowerBound.append(16.25 * pow(2.0,Double(i)))
            noteOctaveUpperBound.append(30.87 * pow(2.0,Double(i)))
        }
        
        //print("noteOctaveLowerBound: ", noteOctaveLowerBound)
        //print("noteOctaveUpperBound: ", noteOctaveUpperBound)
        
        for i in 0...8 {
            if(tracker.frequency >= noteOctaveLowerBound[i] && tracker.frequency <= noteOctaveUpperBound[i]){
                octave = i
                print("Ocatave: ", i)
            }
        }
        
        // Get middle A of the octave we are on
        let middleA = 440 * pow(2, (octave - 5))
        print("middleA: ", middleA)
        
        // Calculate the frequency from middleA
        var octaveFrequencies: [Double] = []
        for i in 3...14{
            let middleACalculation = middleA * pow(2, i / 12)
            octaveFrequencies.append(middleACalculation)
        }
        
        print("octaveFrequencies: ", octaveFrequencies)
        
        // Find the closest value in the octaveFrequencies array
        var smallestValue:Double = 0
        var biggestValue:Double = 10000
        for each in octaveFrequencies{
            //let upperNLower: [Double] = []
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
        print("BIG: ", biggestValue)
        print("SMALL: ", smallestValue)
        print("CLOSEST: ", closest)
        
        // Get the index of the closest value
        let index = octaveFrequencies.firstIndex(of: closest)
        print(index)
        pitchDetectionLabel.text = Notes[index ?? 0]
    }
    
}


