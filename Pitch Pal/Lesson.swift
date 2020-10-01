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

class Lesson: UIViewController {
    
    // Debug Labels
    @IBOutlet weak var pitchDetectionLabel: UILabel!
    @IBOutlet weak var frequencyDebugLabel: UILabel!
    @IBOutlet weak var amplitudeDebugLabel: UILabel!
    
    // UI Piano
    @IBOutlet weak var Piano_C_1: UIButton!
    @IBOutlet weak var Piano_Cs_1: UIButton!
    @IBOutlet weak var Piano_D_1: UIButton!
    @IBOutlet weak var Piano_Ds_1: UIButton!
    @IBOutlet weak var Piano_E_1: UIButton!
    @IBOutlet weak var Piano_F_1: UIButton!
    @IBOutlet weak var Piano_Fs_1: UIButton!
    @IBOutlet weak var Piano_G_1: UIButton!
    @IBOutlet weak var Piano_Gs_1: UIButton!
    @IBOutlet weak var Piano_A_1: UIButton!
    @IBOutlet weak var Piano_As_1: UIButton!
    @IBOutlet weak var Piano_B_1: UIButton!
    
    // Piano StackView
    @IBOutlet weak var Piano_Stack: UIStackView!
    @IBOutlet weak var Piano_StackView_1: UIStackView!
    
    // Game Logic
    let NotesSequence = ["G","B","G","E","D","B"]
    var goalNote = "G"
    var goalIndex = 0
    @IBOutlet weak var Note_G_01: UIImageView!
    @IBOutlet weak var Note_B_02: UIImageView!
    @IBOutlet weak var Note_G_03: UIImageView!
    @IBOutlet weak var Note_E_04: UIImageView!
    @IBOutlet weak var Note_D_05: UIImageView!
    @IBOutlet weak var Note_B_06: UIImageView!
    var NoteImageSequence : [UIImageView] = []
    
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
        
        // Setup lesson logic
        self.NoteImageSequence = [Note_G_01, Note_B_02, Note_G_03, Note_E_04, Note_D_05, Note_B_06]
        
        // Setup UI
        setupPianoUI()

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
                        self.GameLogic()
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
                //print("Ocatave: ", i)
            }
        }
        
        // Get middle A of the octave we are on
        let middleA = 440 * pow(2, (octave - 5))
        //print("middleA: ", middleA)
        
        // Calculate the frequency from middleA
        var octaveFrequencies: [Double] = []
        for i in 3...14{
            let middleACalculation = middleA * pow(2, i / 12)
            octaveFrequencies.append(middleACalculation)
        }
        
        //print("octaveFrequencies: ", octaveFrequencies)
        
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
        //print("BIG: ", biggestValue)
        //print("SMALL: ", smallestValue)
        //print("CLOSEST: ", closest)
        
        // Get the index of the closest value
        let index = octaveFrequencies.firstIndex(of: closest)
        //print(index)
        pitchDetectionLabel.text = Notes[index ?? 0]
        pianoKeyPressedUI()
    }
    
    func setupPianoUI(){
        Piano_C_1.pianoNoteStyle()
        Piano_Cs_1.pianoSharpStyle()
        Piano_D_1.pianoNoteStyle()
        Piano_Ds_1.pianoSharpStyle()
        Piano_E_1.pianoNoteStyle()
        Piano_F_1.pianoNoteStyle()
        Piano_Fs_1.pianoSharpStyle()
        Piano_G_1.pianoNoteStyle()
        Piano_Gs_1.pianoSharpStyle()
        Piano_A_1.pianoNoteStyle()
        Piano_As_1.pianoSharpStyle()
        Piano_B_1.pianoNoteStyle()
    }
    
    func GameLogic(){
        print("Goal Note: " + goalNote)
        print(pitchDetectionLabel.text!)
        print(NoteImageSequence[goalIndex])
        if(pitchDetectionLabel.text! == goalNote && pitchDetectionLabel.text! == NotesSequence[goalIndex]){
            NoteImageSequence[goalIndex].tintColor = UIColor.green
            if(goalIndex >= NotesSequence.count-1){
                CompleteLession()
            }else{
                goalIndex += 1
                goalNote = NotesSequence[goalIndex]
            }
        }
    }
    
    func CompleteLession(){
        print("LESSON COMPLETE :)")
    }
    
    func pianoKeyPressedUI(){
        setupPianoUI()
        if(pitchDetectionLabel.text == "C"){
            Piano_C_1.pianoPressedStyle()
        }else if(pitchDetectionLabel.text == "C#"){
            Piano_Cs_1.pianoPressedStyle()
        }else if(pitchDetectionLabel.text == "D"){
            Piano_D_1.pianoPressedStyle()
        }else if(pitchDetectionLabel.text == "D#"){
            Piano_Ds_1.pianoPressedStyle()
        }else if(pitchDetectionLabel.text == "E"){
            Piano_E_1.pianoPressedStyle()
        }else if(pitchDetectionLabel.text == "F"){
            Piano_F_1.pianoPressedStyle()
        }else if(pitchDetectionLabel.text == "F#"){
            Piano_Fs_1.pianoPressedStyle()
        }else if(pitchDetectionLabel.text == "G"){
            Piano_G_1.pianoPressedStyle()
        }else if(pitchDetectionLabel.text == "G#"){
            Piano_Gs_1.pianoPressedStyle()
        }else if(pitchDetectionLabel.text == "A"){
            Piano_A_1.pianoPressedStyle()
        }else if(pitchDetectionLabel.text == "A#"){
            Piano_As_1.pianoPressedStyle()
        }else if(pitchDetectionLabel.text == "B"){
            Piano_B_1.pianoPressedStyle()
        }
    }
    
}


