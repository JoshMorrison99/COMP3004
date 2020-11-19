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

class Lesson002_Guitar: UIViewController, Subscriber {
    
    // Pause Button
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var mainManu_Yes_Btn: UIButton!
    @IBOutlet weak var mainManu_No_Btn: UIButton!
    
    
    // Lesson text at the top of the screen
    @IBOutlet weak var LessonLabel: UILabel!
    @IBOutlet weak var LessonLabel_number: UILabel!
    
    // Images used during the lesson
    var noteDetectionLabel = UILabel()
    
    // Reference to the guitar UI
    let GuitarUI: GuitarTabUI = GuitarTabUI()
    
    // Reference to the Lesson Model
    private var lessonModel: LessonsModel = LessonsModel()
    
    // Pitch label
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


    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize(PitchDetectionManager: PitchDetectionManager, id: 4)
        
        // Setup Staff UI
        GuitarUI.setupStringUI(view: view)
        
        // Setup Pitch Detection
        PitchDetectionManager.initializePitchDetection()
        
        // Pause Button Setup
        self.setupHomeMenu()

        // Start the Lesson
        self.startLesson()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        PitchDetectionManager.setupPitchDetection()
        
    }
    
    func startLesson(){
        
        noteDetectionLabel.alpha = 0
        GuitarUI.getStrings().alpha = 0
        
        LessonLabel.text = "Hello! Welcome to lesson 2 of the Pitch Pal App. To proceed tap anywhere on the screen."
        LessonLabel_number.text = "1 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step001(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step001(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "Take a look at your guitar and notice the lines and dots under the strings of the guitar."
        LessonLabel_number.text = "2 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "Theses lines are called frets and allow you to play different frequencies of notes by shortening the length of the string with your finger."
        LessonLabel_number.text = "3 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The dots arn't shown on every guitar, but if they are, the dots are positioned on frets 3, 5, 7, 9, 12, 15, 17, 19, 21, 24. These dots are used to help you navigate you ways around the fretboard."
        LessonLabel_number.text = "4 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "Pitch pal read the notes by detecting the frequeuency of sound through your devices microphone. Play a string on your guitar and pitch pal will show you what note you are playing."
        LessonLabel_number.text = "5 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        noteDetectionLabel.alpha = 1
        
        noteDetectionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noteDetectionLabel)
        noteDetectionLabel.widthAnchor.constraint(equalToConstant: 400).isActive = true
        noteDetectionLabel.heightAnchor.constraint(equalToConstant: 400).isActive = true
        noteDetectionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        noteDetectionLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        noteDetectionLabel.font = noteDetectionLabel.font.withSize(200)
        noteDetectionLabel.textAlignment = .center
        noteDetectionLabel.text = pitchLabel
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "Guitar tablature, or tab, is a form of writing down music for guitar, and it mainly uses numbers instead of standard music notation. It's alot easier to read."
        LessonLabel_number.text = "6 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        noteDetectionLabel.alpha = 0
        GuitarUI.getStrings().alpha = 1
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        self.CompleteLession()
    }
    
    func CompleteLession(){
        LessonLabel.text = "Good Job. Lesson Complete"
        LessonLabel_number.text = "100%"
        GuitarUI.getStrings().alpha = 0
        
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



