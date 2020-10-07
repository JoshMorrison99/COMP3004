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

class Lesson001: UIViewController {
    
    // Debug Labels
    @IBOutlet weak var pitchDetectionLabel: UILabel!
    @IBOutlet weak var frequencyDebugLabel: UILabel!
    @IBOutlet weak var amplitudeDebugLabel: UILabel!
    
    // view
    @IBOutlet var myView: UIView!
    
    // Pause Button
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var mainManu_Yes_Btn: UIButton!
    @IBOutlet weak var mainManu_No_Btn: UIButton!
    
    
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
    
    // Ledger Lines
    @IBOutlet weak var Ledger_Line_F: UIView!
    @IBOutlet weak var Ledger_Line_D: UIView!
    @IBOutlet weak var Ledger_Line_B: UIView!
    @IBOutlet weak var Ledger_Line_G: UIView!
    @IBOutlet weak var Ledger_Line_E: UIView!
    
    // Treble Clef Image
    @IBOutlet weak var TrebleClefIMG: UIImageView!
    
    // Ledger Lines View
    @IBOutlet weak var Ledger_Lines_View: UIView!
    
    // Lesson text at the top of the screen
    @IBOutlet weak var LessonLabel: UILabel!
    @IBOutlet weak var LessonLabel_number: UILabel!
    
    
    // Game Logic
    let NotesSequence = ["G","B","E"]
    var goalNote = "G"
    var goalIndex = 0
    var startLessonPlay: Bool = false
    
    @IBOutlet weak var note001: UIImageView!
    @IBOutlet weak var note002: UIImageView!
    @IBOutlet weak var note003: UIImageView!
    
    
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
        
        // Start the lesson with all the UI invisible
        self.startLesson()
        self.removeDebugUI()
        
        // Pause Button Setup
        self.pauseView.isHidden = true
        pauseButton.addTarget(self,
                           action: #selector(pauseButtonClicked),
                           for: .touchUpInside)
        mainManu_Yes_Btn.addTarget(self,
                                   action: #selector(pauseYesButtonClicked),
                                   for: .touchUpInside)
        
        
        // Setup lesson logic
        self.NoteImageSequence = [note001, note002, note003]
        
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
                Timer.scheduledTimer(withTimeInterval: self.timerCycle, repeats: true) { timer in // Timer executes every 1/10 of a second
                    if(self.tracker.amplitude > self.noiseGateThreshold && self.startLessonPlay == true){ // The amplitude is the loudness of the noise. Therefore, if th eloudness of the noise in the microphone is greater than the given threshold then the microphone will pick it up. (noise gate)
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
    
    @objc func pauseYesButtonClicked(){
        do {
            try AKManager.stop()
        }catch{
                print("Error: AudioKit cannot be stopped...")
        }
    }
    
    @IBAction func PauseNoButtonClick(_ sender: Any) {
        self.pauseView.isHidden = true
        print("NO!!!!!!!!!!!!!")
    }
    
    func startLesson(){
        Ledger_Lines_View.alpha = 0
        Ledger_Line_F.alpha = 0
        Ledger_Line_D.alpha = 0
        Ledger_Line_B.alpha = 0
        Ledger_Line_G.alpha = 0
        Ledger_Line_E.alpha = 0
        TrebleClefIMG.alpha = 0
        
        LessonLabel.text = "Hello! Welcome to lesson 1 of the Pitch Pal App. To proceed tap anywhere on the screen."
        LessonLabel_number.text = "1 / 9"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step001(_:)))
        myView.addGestureRecognizer(tap)
    }
    
    @objc func step001(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        Ledger_Lines_View.alpha = 1
        Ledger_Line_F.alpha = 1
        Ledger_Line_D.alpha = 1
        Ledger_Line_B.alpha = 1
        Ledger_Line_G.alpha = 1
        Ledger_Line_E.alpha = 1
        TrebleClefIMG.alpha = 0
        clearNotes()
        LessonLabel.text = "This is the STAFF. It is the foundation upon which notes are drawn. The STAFF consists of 5 lines and 4 spaces. Every line or white space on the STAFF represents a key on the keyboard."
        LessonLabel_number.text = "2 / 9"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        myView.addGestureRecognizer(tap)
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        TrebleClefIMG.alpha = 1
        LessonLabel.text = "Two CLEFS are normally used: Treble and Bass CLEFS. Displayed on the STAFF is the TREBLE CLEF (also called the G clef)."
        LessonLabel_number.text = "3 / 9"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        myView.addGestureRecognizer(tap)
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: E"
        Ledger_Line_E.backgroundColor = UIColor.green
        LessonLabel_number.text = "4 / 9"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        myView.addGestureRecognizer(tap)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: G"
        Ledger_Line_E.backgroundColor = UIColor.black
        Ledger_Line_G.backgroundColor = UIColor.green
        LessonLabel_number.text = "5 / 9"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        myView.addGestureRecognizer(tap)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: B"
        Ledger_Line_E.backgroundColor = UIColor.black
        Ledger_Line_G.backgroundColor = UIColor.black
        Ledger_Line_B.backgroundColor = UIColor.green
        LessonLabel_number.text = "6 / 9"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step006(_:)))
        myView.addGestureRecognizer(tap)
    }
    
    @objc func step006(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: D"
        Ledger_Line_E.backgroundColor = UIColor.black
        Ledger_Line_G.backgroundColor = UIColor.black
        Ledger_Line_B.backgroundColor = UIColor.black
        Ledger_Line_D.backgroundColor = UIColor.green
        LessonLabel_number.text = "7 / 9"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        myView.addGestureRecognizer(tap)
    }
    
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: F"
        Ledger_Line_E.backgroundColor = UIColor.black
        Ledger_Line_G.backgroundColor = UIColor.black
        Ledger_Line_B.backgroundColor = UIColor.black
        Ledger_Line_D.backgroundColor = UIColor.black
        Ledger_Line_F.backgroundColor = UIColor.green
        LessonLabel_number.text = "8 / 9"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step008(_:)))
        myView.addGestureRecognizer(tap)
    }

    @objc func step008(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "Pitch Pal works by picking up the sound through your mobile device's microphone. Play the sequence of notes display. (NOTE: Remember the line letters.)"
        Ledger_Line_E.backgroundColor = UIColor.black
        Ledger_Line_G.backgroundColor = UIColor.black
        Ledger_Line_B.backgroundColor = UIColor.black
        Ledger_Line_D.backgroundColor = UIColor.black
        Ledger_Line_F.backgroundColor = UIColor.black
        LessonLabel_number.text = "9 / 9"
        
        self.displayNotes()
        
        self.startLessonPlay = true
        
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
        LessonLabel.text = "Good Job. Lesson Complete"
        LessonLabel_number.text = "100%"
        Ledger_Lines_View.alpha = 0
        Ledger_Line_F.alpha = 0
        Ledger_Line_D.alpha = 0
        Ledger_Line_B.alpha = 0
        Ledger_Line_G.alpha = 0
        Ledger_Line_E.alpha = 0
        TrebleClefIMG.alpha = 0
    }
    
    @objc func pauseButtonClicked(){
        pauseView.isHidden = false
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
    
    
    func clearNotes(){
        note001.alpha = 0
        note002.alpha = 0
        note003.alpha = 0
    }
    
    func displayNotes(){
        note001.alpha = 1
        note002.alpha = 1
        note003.alpha = 1
    }
    
    func removeDebugUI(){
        self.pitchDetectionLabel.alpha = 0
        self.frequencyDebugLabel.alpha = 0
        self.amplitudeDebugLabel.alpha = 0
    }
}


