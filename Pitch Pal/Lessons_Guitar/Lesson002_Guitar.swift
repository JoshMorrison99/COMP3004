//
//  Lesson001_Guitar.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/29/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class Lesson002_Guitar: UIViewController {
    
    // Pause Button
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var mainManu_Yes_Btn: UIButton!
    @IBOutlet weak var mainManu_No_Btn: UIButton!
    
    
    // Lesson text at the top of the screen
    @IBOutlet weak var LessonLabel: UILabel!
    @IBOutlet weak var LessonLabel_number: UILabel!
    
    
//    // Lesson Logic
//    let NotesSequence = ["G","B","E"]
//    var goalNote = "G"
//    var goalIndex = 0
//    var lessonStepNum = 0
//    var startLessonPlay: Bool = false
//
//    var note001 = UIImageView()
//    var note002 = UIImageView()
//    var note003 = UIImageView()
    
    
    var NoteImageSequence : [UIImageView] = []
    let threeFretNum = UIImageView()
    var noteDetectionLabel = UILabel()
    
    
    
    var lessonStepNum = 0
    
    let Notes = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Staff UI
        GuitarTabUI.shared.setupStringUI(view: view)
        
        // Setup Pitch Detection
        PitchDetection.shared.initializePitchDetection()
        
        // Pause Button Setup
        self.setupHomeMenu()

        // Start the Lesson
        self.startLesson()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        PitchDetection.shared.setupPitchDetection(isPiano: false)
        
        
        self.lessonLoop()
    }
    
    func startLesson(){
        
        noteDetectionLabel.alpha = 0
        GuitarTabUI.shared.getStrings().alpha = 0
        
        LessonLabel.text = "Hello! Welcome to lesson 2 of the Pitch Pal App. To proceed tap anywhere on the screen."
        LessonLabel_number.text = "1 / 9"
        lessonStepNum = 1
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step001(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step001(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "Take a look at your guitar and notice the lines and dots under the strings of the guitar."
        LessonLabel_number.text = "2 / 9"
        lessonStepNum = 2
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "Theses lines are called frets and allow you to play different frequencies of notes by shortening the length of the string with your finger."
        LessonLabel_number.text = "3 / 9"
        lessonStepNum = 3
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The dots arn't shown on every guitar, but if they are, the dots are positioned on frets 3, 5, 7, 9, 12, 15, 17, 19, 21, 24. These dots are used to help you navigate you ways around the fretboard."
        LessonLabel_number.text = "4 / 9"
        lessonStepNum = 4
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "Pitch pal read the notes by detecting the frequeuency of sound through your devices microphone. Play a string on your guitar and pitch pal will show you what note you are playing."
        LessonLabel_number.text = "5 / 9"
        lessonStepNum = 5
        
        noteDetectionLabel.alpha = 1
        
        noteDetectionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noteDetectionLabel)
        noteDetectionLabel.widthAnchor.constraint(equalToConstant: 400).isActive = true
        noteDetectionLabel.heightAnchor.constraint(equalToConstant: 400).isActive = true
        noteDetectionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        noteDetectionLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        noteDetectionLabel.font = noteDetectionLabel.font.withSize(200)
        noteDetectionLabel.textAlignment = .center
        noteDetectionLabel.text = PitchDetection.shared.getLabel()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "Guitar tablature, or tab, is a form of writing down music for guitar, and it mainly uses numbers instead of standard music notation. It's alot easier to read."
        LessonLabel_number.text = "6 / 9"
        lessonStepNum = 6
        
        noteDetectionLabel.alpha = 0
        GuitarTabUI.shared.getStrings().alpha = 1
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step006(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step006(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The symbol being displayed on the tab is a 3. To play this note, put your finger on the 3rd fret of the big E string (the string closest to your head) and strum."
        LessonLabel_number.text = "7 / 8"
        lessonStepNum = 7
        
        PitchDetection.shared.setLabel(newLabel: "#")
        
        threeFretNum.image = UIImage(systemName: "3.circle")
        threeFretNum.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(threeFretNum)
        threeFretNum.widthAnchor.constraint(equalToConstant: 40).isActive = true
        threeFretNum.heightAnchor.constraint(equalToConstant: 40).isActive = true
        threeFretNum.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -105).isActive = true
        threeFretNum.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220).isActive = true
        threeFretNum.tintColor = .red
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        self.CompleteLession()
    }
    
    func CompleteLession(){
        LessonLabel.text = "Good Job. Lesson Complete"
        LessonLabel_number.text = "100%"
        GuitarTabUI.shared.getStrings().alpha = 0
        threeFretNum.alpha = 0
        
    }
    
    func lessonLoop(){
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            if(self.lessonStepNum == 5){
                self.noteDetectionLabel.text = PitchDetection.shared.getLabel()
            }
            if(PitchDetection.shared.getLabel() == "G" && self.lessonStepNum == 7){
                self.CompleteLession()
            }
        }
    }
    
    @objc func pauseButtonClicked(){
        view.bringSubviewToFront(pauseView)
        pauseView.isHidden = false
    }
    
    func setupHomeMenu(){
        self.pauseView.isHidden = true
        pauseButton.addTarget(self,
                           action: #selector(pauseButtonClicked),
                           for: .touchUpInside)
        mainManu_Yes_Btn.addTarget(self,
                                   action: #selector(pauseYesButtonClicked),
                                   for: .touchUpInside)
        view.bringSubviewToFront(pauseView)
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
    }
    
}



