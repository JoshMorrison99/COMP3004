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
        
        
        //self.lessonLoop()
    }
    
    func startLesson(){
        
        
        LessonLabel.text = "Hello! Welcome to lesson 1 of the Pitch Pal App. To proceed tap anywhere on the screen."
        LessonLabel_number.text = "1 / 9"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step001(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step001(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The image on the screen represents the six strings on a guitar."
        LessonLabel_number.text = "2 / 9"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the Big E String."
        LessonLabel_number.text = "3 / 9"
        
        GuitarTabUI.shared.BigELine.backgroundColor = UIColor.green
        GuitarTabUI.shared.ALine.backgroundColor = UIColor.black
        GuitarTabUI.shared.DLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.GLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.BLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.LittleELine.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the A String."
        LessonLabel_number.text = "4 / 9"
        
        GuitarTabUI.shared.BigELine.backgroundColor = UIColor.black
        GuitarTabUI.shared.ALine.backgroundColor = UIColor.green
        GuitarTabUI.shared.DLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.GLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.BLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.LittleELine.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the D String."
        LessonLabel_number.text = "5 / 9"
        
        GuitarTabUI.shared.BigELine.backgroundColor = UIColor.black
        GuitarTabUI.shared.ALine.backgroundColor = UIColor.black
        GuitarTabUI.shared.DLine.backgroundColor = UIColor.green
        GuitarTabUI.shared.GLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.BLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.LittleELine.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the G String."
        LessonLabel_number.text = "6 / 9"
        
        GuitarTabUI.shared.BigELine.backgroundColor = UIColor.black
        GuitarTabUI.shared.ALine.backgroundColor = UIColor.black
        GuitarTabUI.shared.DLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.GLine.backgroundColor = UIColor.green
        GuitarTabUI.shared.BLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.LittleELine.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step006(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step006(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the B String."
        LessonLabel_number.text = "7 / 9"
        
        GuitarTabUI.shared.BigELine.backgroundColor = UIColor.black
        GuitarTabUI.shared.ALine.backgroundColor = UIColor.black
        GuitarTabUI.shared.DLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.GLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.BLine.backgroundColor = UIColor.green
        GuitarTabUI.shared.LittleELine.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        LessonLabel.text = "The highlighted string is the little E String."
        LessonLabel_number.text = "8 / 9"
        
        GuitarTabUI.shared.BigELine.backgroundColor = UIColor.black
        GuitarTabUI.shared.ALine.backgroundColor = UIColor.black
        GuitarTabUI.shared.DLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.GLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.BLine.backgroundColor = UIColor.black
        GuitarTabUI.shared.LittleELine.backgroundColor = UIColor.green
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step008(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step008(_ sender: UITapGestureRecognizer? = nil) {
        CompleteLession()
    }
    
    func CompleteLession(){
        LessonLabel.text = "Good Job. Lesson Complete"
        LessonLabel_number.text = "100%"
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



