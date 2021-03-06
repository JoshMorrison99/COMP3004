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

class Lesson001_Guitar: UIViewController, Subscriber {
    
    // Pause Menu UI
    @IBOutlet weak var pauseMenuBtn: UIButton!
    @IBOutlet weak var pause_Yes_Btn: UIButton!
    @IBOutlet weak var pause_No_Btn: UIButton!
    @IBOutlet weak var pauseView: UIView!
    
    
    // Lesson text at the top of the screen
    @IBOutlet weak var LessonLabel: UILabel!
    @IBOutlet weak var LessonLabel_number: UILabel!
    
    
    // Reference to the Lesson Model
    var lessonModel: LessonsModel = LessonsModel()
    
    // Refernece to the Guitar UI
    let GuitarUI: GuitarTabUI = GuitarTabUI()
    
    var pitchLabel:String!
    
    var PitchDetectionManager = PitchDetection.shared
    var id = Int()
    
    func initialize(PitchDetectionManager : PitchDetection, id : Int) {
        self.PitchDetectionManager = PitchDetectionManager
        self.PitchDetectionManager.addSubscriber(subscriber: self)
        self.id = id
    }
    
    func update() {
        pitchLabel = PitchDetectionManager.pitchLabel
    }
    
    // Images used in the Lesson
    var NoteImageSequence : [UIImageView] = []
    var note001 = UIImageView()
    var note002 = UIImageView()
    var note003 = UIImageView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isIdleTimerDisabled = true
        
        initialize(PitchDetectionManager: PitchDetectionManager, id: 3)
        
        // Setup Staff UI
        GuitarUI.setupStringUI(view: view)
        
        // Setup Pitch Detection
        PitchDetectionManager.initializePitchDetection()
        
        // Hide the pause menu when the screen first loads
        self.pauseView.isHidden = true
        
        setupLesson()
        startLesson()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        PitchDetectionManager.setupPitchDetection()
        
    }
    
    func setupLesson(){
        lessonModel.setLessonGoalNote(lessonNotes: ["G", "D", "E"])
        lessonModel.setGoalNote(newGoalNote: "G")
    }
    
    func startLesson(){
        
        LessonLabel.text = "Hello! Welcome to lesson 1 of the Pitch Pal App. To proceed tap anywhere on the screen."
        LessonLabel_number.text = "1 / 9"
        
        self.NoteImageSequence = [note001, note002, note003]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step001(_:)))
        view.addGestureRecognizer(tap)
        
        
        // Increase the lesson step in the model
        lessonModel.accumulateLessonStepNumber()
    }
    
    @objc func step001(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The image on the screen represents the six strings on a guitar."
        LessonLabel_number.text = "2 / 9"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
        
        // Increase the lesson step in the model
        lessonModel.accumulateLessonStepNumber()
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the Big E String."
        LessonLabel_number.text = "3 / 9"
        
        GuitarUI.BigELine.backgroundColor = UIColor.green
        GuitarUI.ALine.backgroundColor = UIColor.black
        GuitarUI.DLine.backgroundColor = UIColor.black
        GuitarUI.GLine.backgroundColor = UIColor.black
        GuitarUI.BLine.backgroundColor = UIColor.black
        GuitarUI.LittleELine.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
        
        // Increase the lesson step in the model
        lessonModel.accumulateLessonStepNumber()
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the A String."
        LessonLabel_number.text = "4 / 9"
        
        GuitarUI.BigELine.backgroundColor = UIColor.black
        GuitarUI.ALine.backgroundColor = UIColor.green
        GuitarUI.DLine.backgroundColor = UIColor.black
        GuitarUI.GLine.backgroundColor = UIColor.black
        GuitarUI.BLine.backgroundColor = UIColor.black
        GuitarUI.LittleELine.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
        
        // Increase the lesson step in the model
        lessonModel.accumulateLessonStepNumber()
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the D String."
        LessonLabel_number.text = "5 / 9"
        
        GuitarUI.BigELine.backgroundColor = UIColor.black
        GuitarUI.ALine.backgroundColor = UIColor.black
        GuitarUI.DLine.backgroundColor = UIColor.green
        GuitarUI.GLine.backgroundColor = UIColor.black
        GuitarUI.BLine.backgroundColor = UIColor.black
        GuitarUI.LittleELine.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
        
        // Increase the lesson step in the model
        lessonModel.accumulateLessonStepNumber()
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the G String."
        LessonLabel_number.text = "6 / 9"
        
        GuitarUI.BigELine.backgroundColor = UIColor.black
        GuitarUI.ALine.backgroundColor = UIColor.black
        GuitarUI.DLine.backgroundColor = UIColor.black
        GuitarUI.GLine.backgroundColor = UIColor.green
        GuitarUI.BLine.backgroundColor = UIColor.black
        GuitarUI.LittleELine.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step006(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
        
        // Increase the lesson step in the model
        lessonModel.accumulateLessonStepNumber()
    }
    
    @objc func step006(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the B String."
        LessonLabel_number.text = "7 / 9"
        
        GuitarUI.BigELine.backgroundColor = UIColor.black
        GuitarUI.ALine.backgroundColor = UIColor.black
        GuitarUI.DLine.backgroundColor = UIColor.black
        GuitarUI.GLine.backgroundColor = UIColor.black
        GuitarUI.BLine.backgroundColor = UIColor.green
        GuitarUI.LittleELine.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
        
        // Increase the lesson step in the model
        lessonModel.accumulateLessonStepNumber()
    }
    
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the little E String."
        LessonLabel_number.text = "8 / 9"
        
        GuitarUI.BigELine.backgroundColor = UIColor.black
        GuitarUI.ALine.backgroundColor = UIColor.black
        GuitarUI.DLine.backgroundColor = UIColor.black
        GuitarUI.GLine.backgroundColor = UIColor.black
        GuitarUI.BLine.backgroundColor = UIColor.black
        GuitarUI.LittleELine.backgroundColor = UIColor.green
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step008(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
        
        // Increase the lesson step in the model
        lessonModel.accumulateLessonStepNumber()
    }
    
    @objc func step008(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "Complete the sequence of notes displayed. (Remember the lines)"
        LessonLabel_number.text = "9 / 9"
        
        GuitarUI.BigELine.backgroundColor = UIColor.black
        GuitarUI.ALine.backgroundColor = UIColor.black
        GuitarUI.DLine.backgroundColor = UIColor.black
        GuitarUI.GLine.backgroundColor = UIColor.black
        GuitarUI.BLine.backgroundColor = UIColor.black
        GuitarUI.LittleELine.backgroundColor = UIColor.black
        
        note001.image = UIImage(systemName: "3.circle")
        note002.image = UIImage(systemName: "0.circle")
        note003.image = UIImage(systemName: "0.circle")
        
        note001.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note001)
        note001.widthAnchor.constraint(equalToConstant: 40).isActive = true
        note001.heightAnchor.constraint(equalToConstant: 40).isActive = true
        note001.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -102).isActive = true
        note001.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
        
        note002.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note002)
        note002.widthAnchor.constraint(equalToConstant: 40).isActive = true
        note002.heightAnchor.constraint(equalToConstant: 40).isActive = true
        note002.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160).isActive = true
        note002.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220).isActive = true
        
        note003.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note003)
        note003.widthAnchor.constraint(equalToConstant: 40).isActive = true
        note003.heightAnchor.constraint(equalToConstant: 40).isActive = true
        note003.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -102).isActive = true
        note003.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 320).isActive = true
        
        // Render images as templates, so we can change the color
        note001.image = note001.image?.withRenderingMode(.alwaysTemplate)
        note002.image = note002.image?.withRenderingMode(.alwaysTemplate)
        note003.image = note003.image?.withRenderingMode(.alwaysTemplate)
        
        // Set the note color to black
        note001.tintColor = .red
        note002.tintColor = .red
        note003.tintColor = .red
        
        // Increase the lesson step in the model
        lessonModel.accumulateLessonStepNumber()
        
        view.removeGestureRecognizer(sender!)
        
        self.lessonModel.startLesson()
        
        self.lessonLoop()
    }
    
    
    
    func lessonLoop(){
        Timer.scheduledTimer(withTimeInterval: self.lessonModel.getTimer(), repeats: true) { timer in
            if(self.lessonModel.getLessonStepNum() == 9){
                self.LessonLogic()
            }
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
        lessonModel.setTimer(newTimer: 0)
    }
    
    @IBAction func pauseYesClicked(_ sender: Any) {
        do {
            try AKManager.stop()
        }catch{
                print("Error: AudioKit cannot be stopped...")
        }
    }
    
    @IBAction func pauseNoClicked(_ sender: Any) {
        self.pauseView.isHidden = true
    }
    
    @IBAction func pauseBtnClicked(_ sender: Any) {
        view.bringSubviewToFront(pauseView)
        pauseView.isHidden = false
    }
}



