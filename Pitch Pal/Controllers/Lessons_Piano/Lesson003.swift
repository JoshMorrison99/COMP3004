//
//  Lesson002.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/28/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit

class Lesson003: UIViewController {
    
    // Pause menu UI
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var pauseMenuBtn: UIButton!
    @IBOutlet weak var pauseNoBtn: UIButton!
    @IBOutlet weak var pauseYesBtn: UIButton!
    
    // Lesson text UI
    @IBOutlet weak var lessonTextLabel: UILabel!
    @IBOutlet weak var lessonNumberLabel: UILabel!
    
    // Images used in the lesson
    var wholeNoteImg = UIImageView()
    var halfNoteImg = UIImageView()
    var quarterNoteImg = UIImageView()
    var eighthNoteImg = UIImageView()
    var sixteenthNoteImg = UIImageView()
    var eighthNoteDouble = UIImageView()
    var sixteenthNoteDouble = UIImageView()
    
    
    // Reference to the Lesson Model
    var lessonModel: LessonsModel = LessonsModel()
    
    // Reference to Piano UI
    let PianoKeysUI: PianoUI = PianoUI()
    
    // Refernece to pitch detection
    let PitchDetectionManager: PitchDetection = PitchDetection()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isIdleTimerDisabled = true
        
        
        view.viewBackgroundColor()
        
        // Setup Piano UI
        PianoKeysUI.setupPianoUI(view: view)
        
        // Setup Pitch Detection
        PitchDetectionManager.initializePitchDetection()
        
        // Pause Button Setup
        self.setupHomeMenu()

        // Start the Lesson
        self.startLesson()
    }
    
    func setupHomeMenu(){
        self.pauseView.isHidden = true
        view.bringSubviewToFront(pauseView)
    }
    
    func startLesson(){
        
        lessonTextLabel.text = "Hello! Welcome to Lesson 3 of the Pitch Pal App. In this lesson, we are going to learn about note duration. To proceed tap anywhere on the screen."
        lessonNumberLabel.text = "1 / 9"
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step001(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step001(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "The length of time a note is played is called the note's duration. There are different types of notes, with different note durations."
        lessonNumberLabel.text = "2 / 9"
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "The image displayed on screen is called a whole note. This is the longest of the note durations."
        lessonNumberLabel.text = "3 / 9"
        lessonModel.accumulateGoalIndex()
        wholeNoteImg.image = UIImage(named: "wholeNote")
        
        wholeNoteImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wholeNoteImg)
        wholeNoteImg.widthAnchor.constraint(equalToConstant: 300).isActive = true
        wholeNoteImg.heightAnchor.constraint(equalToConstant: 300).isActive = true
        wholeNoteImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        wholeNoteImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        wholeNoteImg.alpha = 1
        halfNoteImg.alpha = 0
        quarterNoteImg.alpha = 0
        eighthNoteImg.alpha = 0
        sixteenthNoteImg.alpha = 0
        eighthNoteDouble.alpha = 0
        sixteenthNoteDouble.alpha = 0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "The image displayed on screen is called a half note. This is the half of the whole notes duration."
        lessonNumberLabel.text = "4 / 9"
        lessonModel.accumulateGoalIndex()
        halfNoteImg.image = UIImage(named: "halfNote")
        
        halfNoteImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(halfNoteImg)
        halfNoteImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        halfNoteImg.heightAnchor.constraint(equalToConstant: 150).isActive = true
        halfNoteImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        halfNoteImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        wholeNoteImg.alpha = 0
        halfNoteImg.alpha = 1
        quarterNoteImg.alpha = 0
        eighthNoteImg.alpha = 0
        sixteenthNoteImg.alpha = 0
        eighthNoteDouble.alpha = 0
        sixteenthNoteDouble.alpha = 0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "The image displayed on screen is called a quarter note. This is the quarter of the whole notes duration."
        lessonNumberLabel.text = "5 / 9"
        lessonModel.accumulateGoalIndex()
        quarterNoteImg.image = UIImage(named: "quarterNote")
        
        quarterNoteImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quarterNoteImg)
        quarterNoteImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        quarterNoteImg.heightAnchor.constraint(equalToConstant: 150).isActive = true
        quarterNoteImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        quarterNoteImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        wholeNoteImg.alpha = 0
        halfNoteImg.alpha = 0
        quarterNoteImg.alpha = 1
        eighthNoteImg.alpha = 0
        sixteenthNoteImg.alpha = 0
        eighthNoteDouble.alpha = 0
        sixteenthNoteDouble.alpha = 0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "The image displayed on screen is called a eighth note. This is the eighth of the whole notes duration."
        lessonNumberLabel.text = "5 / 9"
        lessonModel.accumulateGoalIndex()
        eighthNoteImg.image = UIImage(named: "eighthNote")
        
        eighthNoteImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(eighthNoteImg)
        eighthNoteImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        eighthNoteImg.heightAnchor.constraint(equalToConstant: 150).isActive = true
        eighthNoteImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        eighthNoteImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        wholeNoteImg.alpha = 0
        halfNoteImg.alpha = 0
        quarterNoteImg.alpha = 0
        eighthNoteImg.alpha = 1
        sixteenthNoteImg.alpha = 0
        eighthNoteDouble.alpha = 0
        sixteenthNoteDouble.alpha = 0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step006(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step006(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "The image displayed on screen is called a sixteenth note. This is the sixteenth of the whole notes duration."
        lessonNumberLabel.text = "6 / 9"
        lessonModel.accumulateGoalIndex()
        sixteenthNoteImg.image = UIImage(named: "sixteenthNote")
        
        sixteenthNoteImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sixteenthNoteImg)
        sixteenthNoteImg.widthAnchor.constraint(equalToConstant: 200).isActive = true
        sixteenthNoteImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        sixteenthNoteImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sixteenthNoteImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        wholeNoteImg.alpha = 0
        halfNoteImg.alpha = 0
        quarterNoteImg.alpha = 0
        eighthNoteImg.alpha = 0
        sixteenthNoteImg.alpha = 1
        eighthNoteDouble.alpha = 0
        sixteenthNoteDouble.alpha = 0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "When you combine two eighth notes, you get the symbol displayed now. The symbol acts the same as two eighth notes, just a different symbol."
        lessonNumberLabel.text = "7 / 9"
        lessonModel.accumulateGoalIndex()
        eighthNoteDouble.image = UIImage(named: "eighthNoteDouble")
        
        eighthNoteDouble.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(eighthNoteDouble)
        eighthNoteDouble.widthAnchor.constraint(equalToConstant: 150).isActive = true
        eighthNoteDouble.heightAnchor.constraint(equalToConstant: 150).isActive = true
        eighthNoteDouble.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        eighthNoteDouble.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        wholeNoteImg.alpha = 0
        halfNoteImg.alpha = 0
        quarterNoteImg.alpha = 0
        eighthNoteImg.alpha = 0
        sixteenthNoteImg.alpha = 0
        eighthNoteDouble.alpha = 1
        sixteenthNoteDouble.alpha = 0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step008(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step008(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "The same is true for the sixteenth notes. When you have two sixteenth notes togther, you get the image displayed on screen."
        lessonNumberLabel.text = "8 / 9"
        lessonModel.accumulateGoalIndex()
        sixteenthNoteDouble.image = UIImage(named: "sixteenthNoteDouble")
        
        sixteenthNoteDouble.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sixteenthNoteDouble)
        sixteenthNoteDouble.widthAnchor.constraint(equalToConstant: 150).isActive = true
        sixteenthNoteDouble.heightAnchor.constraint(equalToConstant: 150).isActive = true
        sixteenthNoteDouble.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sixteenthNoteDouble.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        wholeNoteImg.alpha = 0
        halfNoteImg.alpha = 0
        quarterNoteImg.alpha = 0
        eighthNoteImg.alpha = 0
        sixteenthNoteImg.alpha = 0
        eighthNoteDouble.alpha = 0
        sixteenthNoteDouble.alpha = 1
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step009(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step009(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "End of lesson! Good job!"
        lessonNumberLabel.text = "9 / 9"
        lessonModel.accumulateGoalIndex()
        
        wholeNoteImg.alpha = 0
        halfNoteImg.alpha = 0
        quarterNoteImg.alpha = 0
        eighthNoteImg.alpha = 0
        sixteenthNoteImg.alpha = 0
        eighthNoteDouble.alpha = 0
        sixteenthNoteDouble.alpha = 0
    }
    
    @IBAction func pauseYesBtnClicked(_ sender: Any) {
        do {
            try AKManager.stop()
        }catch{
                print("Error: AudioKit cannot be stopped...")
        }
    }
    
    @IBAction func pauseNoBtnClicked(_ sender: Any) {
        self.pauseView.isHidden = true
    }
    
    @IBAction func pauseMenuBtnClicked(_ sender: Any) {
        view.bringSubviewToFront(pauseView)
        pauseView.isHidden = false
    }
}
