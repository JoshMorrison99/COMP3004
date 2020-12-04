//
//  Lesson004.swift
//  Pitch Pal
//
//  Created by Etienne Vivash on 2020-12-02.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit

class Lesson004: UIViewController {
    
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
        
        lessonTextLabel.text = "Hello! Welcome to Lesson 4 of the Pitch Pal App. In this lesson, we are going to test you on what you have learned so far! To proceed tap anywhere on the screen."
        lessonNumberLabel.text = "1 / 12"
        
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step001(_:)))
        view.addGestureRecognizer(tap)
    }

    
    @objc func step001(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        PianoStaffUI.getStaff().alpha = 1
        PianoStaffUI.getTrebleClef().alpha = 1
        PianoStaffUI.FLine.alpha = 1
        PianoStaffUI.DLine.alpha = 1
        PianoStaffUI.GLine.alpha = 1
        PianoStaffUI.BLine.alpha = 1
        PianoStaffUI.ELine.alpha = 1
        lessonTextLabel.text = "Recall from Lesson 2, every line or white space on the STAFF represents a key on the keyboard."
        lessonNumberLabel.text = "2 / 12"
        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        PianoStaffUI.getStaff().alpha = 1
        PianoStaffUI.getTrebleClef().alpha = 1
        PianoStaffUI.FLine.alpha = 1
        PianoStaffUI.DLine.alpha = 1
        PianoStaffUI.GLine.alpha = 1
        PianoStaffUI.BLine.alpha = 1
        PianoStaffUI.ELine.alpha = 1
        lessonTextLabel.text = "Here, we have a note on the 2nd line of the STAFF. Can you remember which note this is?"
        lessonNumberLabel.text = "3 / 12"
        
        note001.image = UIImage(named: "musicnote")
 
        
        note001.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note001)
        note001.widthAnchor.constraint(equalToConstant: 85).isActive = true
        note001.heightAnchor.constraint(equalToConstant: 85).isActive = true
        note001.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140).isActive = true
        note001.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true

        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        PianoStaffUI.getStaff().alpha = 1
        PianoStaffUI.getTrebleClef().alpha = 1
        PianoStaffUI.FLine.alpha = 1
        PianoStaffUI.DLine.alpha = 1
        PianoStaffUI.GLine.alpha = 1
        PianoStaffUI.BLine.alpha = 1
        PianoStaffUI.ELine.alpha = 1
        lessonTextLabel.text = "The 2nd line of the STAFF is G. Now do you remember which white keys on the keyboard is G?"
        lessonNumberLabel.text = "4 / 12"
        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        PianoStaffUI.getStaff().alpha = 1
        PianoStaffUI.getTrebleClef().alpha = 1
        PianoStaffUI.FLine.alpha = 1
        PianoStaffUI.DLine.alpha = 1
        PianoStaffUI.GLine.alpha = 1
        PianoStaffUI.BLine.alpha = 1
        PianoStaffUI.ELine.alpha = 1
        lessonTextLabel.text = "G's are found between every first two keys of the 3 black key group."
        lessonNumberLabel.text = "5 / 12"
        
        PianoKeysUI.notes[11].backgroundColor = UIColor.red
        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        note001.alpha = 0
        PianoKeysUI.notes[11].backgroundColor = UIColor.white
        PianoStaffUI.getStaff().alpha = 1
        PianoStaffUI.getTrebleClef().alpha = 1
        PianoStaffUI.FLine.alpha = 1
        PianoStaffUI.DLine.alpha = 1
        PianoStaffUI.GLine.alpha = 1
        PianoStaffUI.BLine.alpha = 1
        PianoStaffUI.ELine.alpha = 1
        lessonTextLabel.text = "Here, we have a note on the 3rd line of the STAFF. Can you remember which note this is?"
        lessonNumberLabel.text = "6 / 12"
        
        note002.image = UIImage(named: "musicnote")
        
        note002.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note002)
        note002.widthAnchor.constraint(equalToConstant: 85).isActive = true
        note002.heightAnchor.constraint(equalToConstant: 85).isActive = true
        note002.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -175).isActive = true
        note002.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220).isActive = true

        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step006(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step006(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        PianoStaffUI.getStaff().alpha = 1
        PianoStaffUI.getTrebleClef().alpha = 1
        PianoStaffUI.FLine.alpha = 1
        PianoStaffUI.DLine.alpha = 1
        PianoStaffUI.GLine.alpha = 1
        PianoStaffUI.BLine.alpha = 1
        PianoStaffUI.ELine.alpha = 1
        lessonTextLabel.text = "The 3rd line of the STAFF is B. Now do you remember which white keys on the keyboard is B?"
        lessonNumberLabel.text = "7 / 12"
        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        PianoStaffUI.getStaff().alpha = 1
        PianoStaffUI.getTrebleClef().alpha = 1
        PianoStaffUI.FLine.alpha = 1
        PianoStaffUI.DLine.alpha = 1
        PianoStaffUI.GLine.alpha = 1
        PianoStaffUI.BLine.alpha = 1
        PianoStaffUI.ELine.alpha = 1
        lessonTextLabel.text = "B's are found after every 3 black key group."
        lessonNumberLabel.text = "8 / 12"
        
        PianoKeysUI.notes[13].backgroundColor = UIColor.red
        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step008(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step008(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        note002.alpha = 0
        PianoKeysUI.notes[13].backgroundColor = UIColor.white
        PianoStaffUI.getStaff().alpha = 1
        PianoStaffUI.getTrebleClef().alpha = 1
        PianoStaffUI.FLine.alpha = 1
        PianoStaffUI.DLine.alpha = 1
        PianoStaffUI.GLine.alpha = 1
        PianoStaffUI.BLine.alpha = 1
        PianoStaffUI.ELine.alpha = 1
        lessonTextLabel.text = "Here, we have a note on the white space between the 2nd and 3rd line of the STAFF. Can you remember which note this is?"
        lessonNumberLabel.text = "9 / 12"
        
        note003.image = UIImage(named: "musicnote")
        
        note003.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(note003)
        note003.widthAnchor.constraint(equalToConstant: 85).isActive = true
        note003.heightAnchor.constraint(equalToConstant: 85).isActive = true
        note003.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -157.5).isActive = true
        note003.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 320).isActive = true

        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step009(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    
    @objc func step009(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        PianoStaffUI.getStaff().alpha = 1
        PianoStaffUI.getTrebleClef().alpha = 1
        PianoStaffUI.FLine.alpha = 1
        PianoStaffUI.DLine.alpha = 1
        PianoStaffUI.GLine.alpha = 1
        PianoStaffUI.BLine.alpha = 1
        PianoStaffUI.ELine.alpha = 1
        lessonTextLabel.text = "The white space between the 2nd and 3rd line of the STAFF is A. Now do you remember which white keys on the keyboard is A?"
        lessonNumberLabel.text = "10 / 12"
        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step010(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }
    
    @objc func step010(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        PianoStaffUI.getStaff().alpha = 1
        PianoStaffUI.getTrebleClef().alpha = 1
        PianoStaffUI.FLine.alpha = 1
        PianoStaffUI.DLine.alpha = 1
        PianoStaffUI.GLine.alpha = 1
        PianoStaffUI.BLine.alpha = 1
        PianoStaffUI.ELine.alpha = 1
        lessonTextLabel.text = "A's are found between every last two keys of the 3 black key group."
        lessonNumberLabel.text = "11 / 12"
        
        PianoKeysUI.notes[12].backgroundColor = UIColor.red
        
        lessonModel.accumulateLessonStepNumber()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step011(_:)))
        view.addGestureRecognizer(tap)
        
        view.removeGestureRecognizer(sender!)
    }

    @objc func step011(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        note003.alpha = 0
        PianoKeysUI.notes[12].backgroundColor = UIColor.white
        PianoStaffUI.getStaff().alpha = 0
        PianoStaffUI.getTrebleClef().alpha = 0
        PianoStaffUI.FLine.alpha = 0
        PianoStaffUI.DLine.alpha = 0
        PianoStaffUI.GLine.alpha = 0
        PianoStaffUI.BLine.alpha = 0
        PianoStaffUI.ELine.alpha = 0
        
        lessonTextLabel.text = "End of Lesson 4. If you have succeeded through this lesson with ease, you can now proceed to Lesson 5. If not, please review Lesson 1-3. Bye!"
        lessonNumberLabel.text = "12 / 12"
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
