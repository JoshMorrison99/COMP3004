//
//  Lesson003_Guitar.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 12/5/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class Lesson003_Guitar: UIViewController, Subscriber {
    
    // Pause Button
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var mainManu_Yes_Btn: UIButton!
    @IBOutlet weak var mainManu_No_Btn: UIButton!
    
    var GchordImg = UIImageView()
    var EmchordImg = UIImageView()
    var DchordImg = UIImageView()
    
    
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
        
        GchordImg.alpha = 0
        EmchordImg.alpha = 0
        DchordImg.alpha = 0
        
        noteDetectionLabel.alpha = 0
        GuitarUI.getStrings().alpha = 0
        
        LessonLabel.text = "Hello! Welcome to lesson 3 of the Pitch Pal App. To proceed tap anywhere on the screen."
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
        LessonLabel.text = "The image below displays how to play a G chord. The filled in circles are where your fingers go and the outlined circle is an open string. Give it a try."
        LessonLabel_number.text = "4 / 9"
        GchordImg.image = UIImage(named: "gchord")
        
        GchordImg.alpha = 1
        EmchordImg.alpha = 0
        DchordImg.alpha = 0
        
        GchordImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(GchordImg)
        GchordImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        GchordImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        GchordImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        GchordImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The image below displays how to play an Em chord. Give it a try"
        LessonLabel_number.text = "5 / 9"
        EmchordImg.image = UIImage(named: "emchord")
        
        GchordImg.alpha = 0
        EmchordImg.alpha = 1
        DchordImg.alpha = 0
        
        EmchordImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(EmchordImg)
        EmchordImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        EmchordImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        EmchordImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        EmchordImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        lessonModel.accumulateLessonStepNumber()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The image below displays how to play a D chord. The x indicates that the string is not to be played. Give it a try."
        LessonLabel_number.text = "6 / 9"
        DchordImg.image = UIImage(named: "dchord")
        
        GchordImg.alpha = 0
        EmchordImg.alpha = 0
        DchordImg.alpha = 1
        
        DchordImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(DchordImg)
        DchordImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        DchordImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        DchordImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        DchordImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        lessonModel.accumulateLessonStepNumber()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        GchordImg.alpha = 0
        EmchordImg.alpha = 0
        DchordImg.alpha = 0
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



