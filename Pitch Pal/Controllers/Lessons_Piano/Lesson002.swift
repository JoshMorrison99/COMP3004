//
//  Lesson003.swift
//  Pitch Pal
//
//  Created by Etienne Vivash on 2020-12-02.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit

class Lesson002: UIViewController {
    
    // Pause menu UI
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var pauseMenuBtn: UIButton!
    @IBOutlet weak var pauseNoBtn: UIButton!
    @IBOutlet weak var pauseYesBtn: UIButton!
    
    // Lesson text UI
    @IBOutlet weak var lessonTextLabel: UILabel!
    @IBOutlet weak var lessonNumberLabel: UILabel!

    
    // Images used in the lesson
    var NoteImageSequence : [UIImageView] = []
    var note001 = UIImageView()
    var note002 = UIImageView()
    var note003 = UIImageView()
    
    // Reference to the Lesson Model
    var lessonModel: LessonsModel = LessonsModel()
    
    // Reference to Piano UI
    let PianoKeysUI: PianoUI = PianoUI()
    let PianoStaffUI:StaffUI = StaffUI()
    
    // Reference to pitch detection
    let PitchDetectionManager: PitchDetection = PitchDetection()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.viewBackgroundColor()
        
        // Setup Staff UI
        PianoStaffUI.setupStaffUI(view: view)
        
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
        PianoStaffUI.getStaff().alpha = 0
        PianoStaffUI.getTrebleClef().alpha = 0
        
        lessonTextLabel.text = "Hello! Welcome to Lesson 2 of the Pitch Pal App. In this lesson, we are going to learn about the staff and the treble clef. To proceed tap anywhere on the screen."
        lessonNumberLabel.text = "1 / 13"
        
        lessonModel.accumulateGoalIndex()
        
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
        lessonTextLabel.text = "This is the STAFF. It is the foundation upon which notes are drawn. The STAFF consists of 5 lines and 4 spaces. Every line or white space on the STAFF represents a key on the keyboard."
        lessonNumberLabel.text = "2 / 13"
        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        lessonTextLabel.text = "Two CLEFS are normally used: Treble and Bass CLEFS. Displayed on the STAFF is the TREBLE CLEF (also called the G clef). We will only be using the TREBLE CLEF for the moment."
        lessonNumberLabel.text = "3 / 13"
        lessonModel.accumulateLessonStepNumber()
        PianoStaffUI.getTrebleClef().alpha = 1
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        lessonTextLabel.text = "The highlighted line shown is: E"
        PianoStaffUI.ELine.backgroundColor = UIColor.green
        lessonNumberLabel.text = "4 / 13"
    
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        lessonTextLabel.text = "The white space between highlighted lines shown is: F"
        PianoStaffUI.ELine.backgroundColor = UIColor.green
        PianoStaffUI.GLine.backgroundColor = UIColor.green
        lessonNumberLabel.text = "5 / 13"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        lessonTextLabel.text = "The highlighted line shown is: G"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.green
        lessonNumberLabel.text = "6 / 13"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step006(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    @objc func step006(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        lessonTextLabel.text = "The white space between highlighted lines shown is: A"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.green
        PianoStaffUI.BLine.backgroundColor = UIColor.green
        lessonNumberLabel.text = "7 / 13"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        lessonTextLabel.text = "The highlighted line shown is: B"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.black
        PianoStaffUI.BLine.backgroundColor = UIColor.green
        lessonNumberLabel.text = "8 / 13"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step008(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step008(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        lessonTextLabel.text = "The white space between highlighted lines shown is: C"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.black
        PianoStaffUI.BLine.backgroundColor = UIColor.green
        PianoStaffUI.DLine.backgroundColor = UIColor.green
        lessonNumberLabel.text = "9 / 13"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step009(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step009(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        lessonTextLabel.text = "The highlighted line shown is: D"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.black
        PianoStaffUI.BLine.backgroundColor = UIColor.black
        PianoStaffUI.DLine.backgroundColor = UIColor.green
        lessonNumberLabel.text = "10 / 13"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step010(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step010(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        lessonTextLabel.text = "The white space between highlighted lines shown is: E"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.black
        PianoStaffUI.BLine.backgroundColor = UIColor.black
        PianoStaffUI.DLine.backgroundColor = UIColor.green
        PianoStaffUI.FLine.backgroundColor = UIColor.green
        lessonNumberLabel.text = "11 / 13"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step011(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step011(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        lessonTextLabel.text = "The highlighted line shown is: F"
        PianoStaffUI.ELine.backgroundColor = UIColor.black
        PianoStaffUI.GLine.backgroundColor = UIColor.black
        PianoStaffUI.BLine.backgroundColor = UIColor.black
        PianoStaffUI.DLine.backgroundColor = UIColor.black
        PianoStaffUI.FLine.backgroundColor = UIColor.green
        lessonNumberLabel.text = "12 / 13"
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step012(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step012(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        PianoStaffUI.getStaff().alpha = 0
        PianoStaffUI.getTrebleClef().alpha = 0
        PianoStaffUI.FLine.alpha = 0
        PianoStaffUI.DLine.alpha = 0
        PianoStaffUI.GLine.alpha = 0
        PianoStaffUI.BLine.alpha = 0
        PianoStaffUI.ELine.alpha = 0
        
        lessonTextLabel.text = "End of Lesson 2. Great job! You are now ready for Lesson 3."
        lessonNumberLabel.text = "13 / 13"
        lessonModel.accumulateLessonStepNumber()
        
        
        view.removeGestureRecognizer(sender!)
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
