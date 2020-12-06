//
//  Lesson004_Guitar.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 12/6/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class Lesson004_guitar: UIViewController, Subscriber {
    
    // Pause Button
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var mainManu_Yes_Btn: UIButton!
    @IBOutlet weak var mainManu_No_Btn: UIButton!
    
    var AmchordImg = UIImageView()
    var CchordImg = UIImageView()
    var D6chordImg = UIImageView()
    
    
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
        
        UIApplication.shared.isIdleTimerDisabled = true
        
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
        
        AmchordImg.alpha = 0
        CchordImg.alpha = 0
        D6chordImg.alpha = 0
        
        noteDetectionLabel.alpha = 0
        GuitarUI.getStrings().alpha = 0
        
        LessonLabel.text = "Hello! Welcome to lesson 4 of the Pitch Pal App. To proceed tap anywhere on the screen."
        LessonLabel_number.text = "1 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step001(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step001(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "In this lesson we are going to learn about guitar chords."
        LessonLabel_number.text = "2 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "A guitar chord is a set of notes played on a guitar."
        LessonLabel_number.text = "3 / 9"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The image below displays how to play a A minor chord. The filled in circles are where your fingers go and the outlined circle is an open string. Give it a try."
        LessonLabel_number.text = "4 / 9"
        AmchordImg.image = UIImage(named: "amchord")
        
        AmchordImg.alpha = 1
        CchordImg.alpha = 0
        D6chordImg.alpha = 0
        
        AmchordImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(AmchordImg)
        AmchordImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        AmchordImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        AmchordImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        AmchordImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The image below displays how to play an C chord. Give it a try"
        LessonLabel_number.text = "5 / 9"
        CchordImg.image = UIImage(named: "cchord")
        
        AmchordImg.alpha = 0
        CchordImg.alpha = 1
        D6chordImg.alpha = 0
        
        CchordImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(CchordImg)
        CchordImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        CchordImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        CchordImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        CchordImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        lessonModel.accumulateLessonStepNumber()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The image below displays how to play a D6 chord. The x indicates that the string is not to be played. Give it a try."
        LessonLabel_number.text = "6 / 9"
        D6chordImg.image = UIImage(named: "d6chord")
        
        AmchordImg.alpha = 0
        CchordImg.alpha = 0
        D6chordImg.alpha = 1
        
        D6chordImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(D6chordImg)
        D6chordImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        D6chordImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        D6chordImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        D6chordImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        lessonModel.accumulateLessonStepNumber()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        AmchordImg.alpha = 0
        CchordImg.alpha = 0
        D6chordImg.alpha = 0
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



