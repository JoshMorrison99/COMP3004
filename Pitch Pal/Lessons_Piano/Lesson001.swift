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
    
    // Pause Button
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var mainManu_Yes_Btn: UIButton!
    @IBOutlet weak var mainManu_No_Btn: UIButton!
    
    
    // Lesson text at the top of the screen
    @IBOutlet weak var LessonLabel: UILabel!
    @IBOutlet weak var LessonLabel_number: UILabel!
    
    
    // Lesson Logic
    let NotesSequence = ["G","B","E"]
    var goalNote = "G"
    var goalIndex = 0
    var lessonStepNum = 0
    var startLessonPlay: Bool = false
    
    var note001 = UIImageView()
    var note002 = UIImageView()
    var note003 = UIImageView()
    
    let PianoStaffUI:StaffUI = StaffUI()
    
    
    var NoteImageSequence : [UIImageView] = []
    
    let Notes = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Staff UI
        PianoStaffUI.setupStaffUI(view: view)
        
        // Setup Piano UI
        PianoUI.shared.setupPianoUI(view: view)
        
        // Setup Pitch Detection
        PitchDetection.shared.initializePitchDetection()
        
        // Pause Button Setup
        self.setupHomeMenu()

        // Start the Lesson
        self.startLesson()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        PitchDetection.shared.setupPitchDetection(isPiano: true)
        
        
        self.lessonLoop()
    }
    
    func startLesson(){
        PianoStaffUI.getStaff().alpha = 0
        PianoStaffUI.getTrebleClef().alpha = 0
        
        self.NoteImageSequence = [note001, note002, note003]
        
        LessonLabel.text = "Hello! Welcome to lesson 1 of the Pitch Pal App. To proceed tap anywhere on the screen."
        LessonLabel_number.text = "1 / 9"
        lessonStepNum = 1
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step001(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step001(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        PianoStaffUI.getStaff().alpha = 1
        PianoStaffUI.FLine.alpha = 1
        PianoStaffUI.DLine.alpha = 1
        PianoStaffUI.GLine.alpha = 1
        PianoStaffUI.BLine.alpha = 1
        PianoStaffUI.ELine.alpha = 1
        clearNotes()
        LessonLabel.text = "This is the STAFF. It is the foundation upon which notes are drawn. The STAFF consists of 5 lines and 4 spaces. Every line or white space on the STAFF represents a key on the keyboard."
        LessonLabel_number.text = "2 / 9"
        lessonStepNum = 2
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "Two CLEFS are normally used: Treble and Bass CLEFS. Displayed on the STAFF is the TREBLE CLEF (also called the G clef)."
        LessonLabel_number.text = "3 / 9"
        lessonStepNum = 3
        PianoStaffUI.getTrebleClef().alpha = 1
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: E"
        PianoStaffUI.ELine.backgroundColor = UIColor.green
        LessonLabel_number.text = "4 / 9"
        lessonStepNum = 4
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: G"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.green
        LessonLabel_number.text = "5 / 9"
        lessonStepNum = 5
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: B"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.black
        PianoStaffUI.BLine.backgroundColor = UIColor.green
        LessonLabel_number.text = "6 / 9"
        lessonStepNum = 6
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step006(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step006(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: D"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.black
        PianoStaffUI.BLine.backgroundColor = UIColor.black
        PianoStaffUI.DLine.backgroundColor = UIColor.green
        LessonLabel_number.text = "7 / 9"
        lessonStepNum = 7
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: F"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.black
        PianoStaffUI.BLine.backgroundColor = UIColor.black
        PianoStaffUI.DLine.backgroundColor = UIColor.black
        PianoStaffUI.FLine.backgroundColor = UIColor.green
        LessonLabel_number.text = "8 / 9"
        lessonStepNum = 8
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step008(_:)))
        view.addGestureRecognizer(tap)
    }

    @objc func step008(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "Pitch Pal works by picking up the sound through your mobile device's microphone. Play the sequence of notes display. (NOTE: Remember the line letters.)"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.black
        PianoStaffUI.BLine.backgroundColor = UIColor.black
        PianoStaffUI.DLine.backgroundColor = UIColor.black
        PianoStaffUI.FLine.backgroundColor = UIColor.black
        
        note001.image = UIImage(named: "musicnote")
        note002.image = UIImage(named: "musicnote")
        note003.image = UIImage(named: "musicnote")
        
        note001.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note001)
        note001.widthAnchor.constraint(equalToConstant: 85).isActive = true
        note001.heightAnchor.constraint(equalToConstant: 85).isActive = true
        note001.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140).isActive = true
        note001.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
        
        note002.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note002)
        note002.widthAnchor.constraint(equalToConstant: 85).isActive = true
        note002.heightAnchor.constraint(equalToConstant: 85).isActive = true
        note002.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -175).isActive = true
        note002.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220).isActive = true
        
        note003.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note003)
        note003.widthAnchor.constraint(equalToConstant: 85).isActive = true
        note003.heightAnchor.constraint(equalToConstant: 85).isActive = true
        note003.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -105).isActive = true
        note003.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 320).isActive = true
        
        // Render images as templates, so we can change the color
        note001.image = note001.image?.withRenderingMode(.alwaysTemplate)
        note002.image = note001.image?.withRenderingMode(.alwaysTemplate)
        note003.image = note001.image?.withRenderingMode(.alwaysTemplate)
        
        // Set the note color to black
        note001.tintColor = .black
        note002.tintColor = .black
        note003.tintColor = .black
        
        
        LessonLabel_number.text = "9 / 9"
        lessonStepNum = 9
        
        self.displayNotes()
        
        self.startLessonPlay = true
        
    }
    
    func lessonLoop(){
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            if(self.lessonStepNum == 9){
                self.LessonLogic()
            }
        }
    }
    
    func LessonLogic(){
        if(PitchDetection.shared.getLabel() == goalNote && PitchDetection.shared.getLabel() == NotesSequence[goalIndex]){
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
        PianoStaffUI.staff.alpha = 0
        PianoStaffUI.getTrebleClef().alpha = 0
        clearNotes()
    }
    
    @objc func pauseButtonClicked(){
        view.bringSubviewToFront(pauseView)
        pauseView.isHidden = false
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


