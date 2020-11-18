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

class Lesson001: UIViewController, Subscriber {
    
    // Pitch label
    var pitchLabel:String!
    
    var PitchDetectionManager = PitchDetection()
    var id = Int()
    
    func initialize(PitchDetectionManager : PitchDetection, id : Int) {
        self.PitchDetectionManager = PitchDetectionManager
        self.PitchDetectionManager.addSubscriber(subscriber: self)
        self.id = id
    }
    
    func update() {
        pitchLabel = PitchDetectionManager.pitchLabel
    }
    
    // Pause Button
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var mainManu_Yes_Btn: UIButton!
    @IBOutlet weak var mainManu_No_Btn: UIButton!
    
    
    // Lesson text at the top of the screen
    @IBOutlet weak var LessonLabel: UILabel!
    @IBOutlet weak var LessonLabel_number: UILabel!
    
    var noteDetectionTimer = Timer()
    var noteDetectionTimerCycle:Double = 0.05
    
    
    // Images used in the lesson
    var NoteImageSequence : [UIImageView] = []
    var note001 = UIImageView()
    var note002 = UIImageView()
    var note003 = UIImageView()
    
    // Reference to the Lesson Model
    var lessonModel: LessonsModel = LessonsModel()
    
    let PianoStaffUI:StaffUI = StaffUI()
    let PianoKeysUI: PianoUI = PianoUI()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize(PitchDetectionManager: PitchDetectionManager, id: 1)
        
        // Setup Staff UI
        PianoStaffUI.setupStaffUI(view: view)
        
        // Setup Piano UI
        PianoKeysUI.setupPianoUI(view: view)
        
        // Setup Pitch Detection
        PitchDetectionManager.initializePitchDetection()
        
        // Pause Button Setup
        self.setupHomeMenu()

        setupLesson()
        
        startLesson()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        PitchDetectionManager.setupPitchDetection()
        
        pianoKeysPressedUI()
        
        
        self.lessonLoop()
    }
    
    func setupLesson(){
        lessonModel.setLessonGoalNote(lessonNotes: ["G","B","E"])
        lessonModel.setGoalNote(newGoalNote: "G")
    }
    
    func startLesson(){
        PianoStaffUI.getStaff().alpha = 0
        PianoStaffUI.getTrebleClef().alpha = 0
        
        self.NoteImageSequence = [note001, note002, note003]
        
        LessonLabel.text = "Hello! Welcome to lesson 1 of the Pitch Pal App. To proceed tap anywhere on the screen."
        LessonLabel_number.text = "1 / 9"
        lessonModel.accumulateLessonStepNumber()
        
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
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "Two CLEFS are normally used: Treble and Bass CLEFS. Displayed on the STAFF is the TREBLE CLEF (also called the G clef)."
        LessonLabel_number.text = "3 / 9"
        lessonModel.accumulateLessonStepNumber()
        PianoStaffUI.getTrebleClef().alpha = 1
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: E"
        PianoStaffUI.ELine.backgroundColor = UIColor.green
        LessonLabel_number.text = "4 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: G"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.green
        LessonLabel_number.text = "5 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: B"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.black
        PianoStaffUI.BLine.backgroundColor = UIColor.green
        LessonLabel_number.text = "6 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step006(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step006(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        LessonLabel.text = "The highlighted line show is: D"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.black
        PianoStaffUI.BLine.backgroundColor = UIColor.black
        PianoStaffUI.DLine.backgroundColor = UIColor.green
        LessonLabel_number.text = "7 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
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
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step008(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
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
        
        view.removeGestureRecognizer(sender!)
        
        LessonLabel_number.text = "9 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        self.displayNotes()
        
        lessonModel.startLesson()
        
    }
    
    func lessonLoop(){
        Timer.scheduledTimer(withTimeInterval: lessonModel.getTimer(), repeats: true) { timer in
            if(self.lessonModel.getLessonStepNum() == 9){
                self.LessonLogic()
            }
        }
    }
    
    func pianoKeysPressedUI(){
        Timer.scheduledTimer(withTimeInterval: self.noteDetectionTimerCycle, repeats: true) { noteDetectionTimer in // Timer executes every 1/10 of a second
            self.PianoKeysUI.pianoKeyPressedUI(pitchDetectionLabel: self.pitchLabel)
        }
        
    }
    
    func LessonLogic(){
        if(pitchLabel == lessonModel.getGoalNote() && pitchLabel == lessonModel.getLessonGoalNote()[lessonModel.getGoalIndex()]){
            NoteImageSequence[lessonModel.getGoalIndex()].tintColor = UIColor.green
            if(lessonModel.getGoalIndex() >= lessonModel.getLessonGoalNote().count-1){
                CompleteLession()
            }else{
                lessonModel.accumulateGoalIndex()
                lessonModel.setGoalNote(newGoalNote: lessonModel.getLessonGoalNote()[lessonModel.getGoalIndex()])
            }
        }
    }
    
    func CompleteLession(){
        LessonLabel.text = "Good Job. Lesson Complete"
        LessonLabel_number.text = "100%"
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


