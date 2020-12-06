//
//  Lesson001.swift
//  Pitch Pal
//
//  Created by Etienne Vivash on 2020-12-02.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit

class Lesson001: UIViewController {
    
    // Pause menu UI
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var pauseMenuBtn: UIButton!
    @IBOutlet weak var pauseNoBtn: UIButton!
    @IBOutlet weak var pauseYesBtn: UIButton!
    
    // Lesson text UI
    @IBOutlet weak var lessonTextLabel: UILabel!
    @IBOutlet weak var lessonNumberLabel: UILabel!

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
        
        lessonTextLabel.text = "Hello! Welcome to Lesson 1 of the Pitch Pal App. In this lesson, we are going to learn about the piano keyboard. To proceed tap anywhere on the screen."
        lessonNumberLabel.text = "1 / 11"
        
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step001(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step001(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "The keyboard is made up of white keys and black keys. The black keys are arranged in groups of two and three. As you move up the keyboard, the notes sound higher. As you move down the keyboard, the notes sound lower."
        lessonNumberLabel.text = "2 / 11"

        
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step002(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step002(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "For the moment, we will only pay attention to the white keys. They are A, B, C, D, E, F, and G repeated over and over."
        lessonNumberLabel.text = "3 / 11"

        
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step003(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step003(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "This is the C key. C's are found before every 2 black key group."
        lessonNumberLabel.text = "4 / 11"
        
        //showing C keys
        PianoKeysUI.notes[0].backgroundColor = UIColor.red
        PianoKeysUI.notes[7].backgroundColor = UIColor.red
        PianoKeysUI.notes[14].backgroundColor = UIColor.red
        PianoKeysUI.notes[21].backgroundColor = UIColor.red
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step004(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step004(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "This is the D key. D's are found between every 2 black key group."
        lessonNumberLabel.text = "5 / 11"
        
        // Removing C keys
        PianoKeysUI.notes[0].backgroundColor = UIColor.white
        PianoKeysUI.notes[7].backgroundColor = UIColor.white
        PianoKeysUI.notes[14].backgroundColor = UIColor.white
        PianoKeysUI.notes[21].backgroundColor = UIColor.white
        
        // Showing D keys
        PianoKeysUI.notes[1].backgroundColor = UIColor.red
        PianoKeysUI.notes[8].backgroundColor = UIColor.red
        PianoKeysUI.notes[15].backgroundColor = UIColor.red
        PianoKeysUI.notes[22].backgroundColor = UIColor.red
        
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step005(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func step005(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "This is the E key. E's are found after every 2 black key group."
        lessonNumberLabel.text = "6 / 11"
        
        // Removing D keys
        PianoKeysUI.notes[1].backgroundColor = UIColor.white
        PianoKeysUI.notes[8].backgroundColor = UIColor.white
        PianoKeysUI.notes[15].backgroundColor = UIColor.white
        PianoKeysUI.notes[22].backgroundColor = UIColor.white
        
        // Showing E keys
        PianoKeysUI.notes[2].backgroundColor = UIColor.red
        PianoKeysUI.notes[9].backgroundColor = UIColor.red
        PianoKeysUI.notes[16].backgroundColor = UIColor.red
        PianoKeysUI.notes[23].backgroundColor = UIColor.red
        
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step006(_:)))
        view.addGestureRecognizer(tap)
    }
    @objc func step006(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "This is the F key. F's are found before every 3 black key group."
        lessonNumberLabel.text = "7 / 11"
        
        // Removing E keys
        PianoKeysUI.notes[2].backgroundColor = UIColor.white
        PianoKeysUI.notes[9].backgroundColor = UIColor.white
        PianoKeysUI.notes[16].backgroundColor = UIColor.white
        PianoKeysUI.notes[23].backgroundColor = UIColor.white
        
        // Showing F keys
        PianoKeysUI.notes[3].backgroundColor = UIColor.red
        PianoKeysUI.notes[10].backgroundColor = UIColor.red
        PianoKeysUI.notes[17].backgroundColor = UIColor.red
        PianoKeysUI.notes[24].backgroundColor = UIColor.red
        
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step007(_:)))
        view.addGestureRecognizer(tap)
    }
    @objc func step007(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "This is the G key. G's are found between every first two keys of the 3 black key group."
        lessonNumberLabel.text = "8 / 11"
        
        // Removing F keys
        PianoKeysUI.notes[3].backgroundColor = UIColor.white
        PianoKeysUI.notes[10].backgroundColor = UIColor.white
        PianoKeysUI.notes[17].backgroundColor = UIColor.white
        PianoKeysUI.notes[24].backgroundColor = UIColor.white
        
        // Showing G keys
        PianoKeysUI.notes[4].backgroundColor = UIColor.red
        PianoKeysUI.notes[11].backgroundColor = UIColor.red
        PianoKeysUI.notes[18].backgroundColor = UIColor.red
        PianoKeysUI.notes[25].backgroundColor = UIColor.red
        
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step008(_:)))
        view.addGestureRecognizer(tap)
    }
    @objc func step008(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "This is the A key. A's are found between every last two keys of the 3 black key group."
        lessonNumberLabel.text = "9 / 11"
        
        // Removing G keys
        PianoKeysUI.notes[4].backgroundColor = UIColor.white
        PianoKeysUI.notes[11].backgroundColor = UIColor.white
        PianoKeysUI.notes[18].backgroundColor = UIColor.white
        PianoKeysUI.notes[25].backgroundColor = UIColor.white
        
        // Showing A keys
        PianoKeysUI.notes[5].backgroundColor = UIColor.red
        PianoKeysUI.notes[12].backgroundColor = UIColor.red
        PianoKeysUI.notes[19].backgroundColor = UIColor.red
        PianoKeysUI.notes[26].backgroundColor = UIColor.red
        
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step009(_:)))
        view.addGestureRecognizer(tap)
    }
    @objc func step009(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "This is the B key. B's are found after every 3 black key group."
        lessonNumberLabel.text = "10 / 11"
        
        // Removing A keys
        PianoKeysUI.notes[5].backgroundColor = UIColor.white
        PianoKeysUI.notes[12].backgroundColor = UIColor.white
        PianoKeysUI.notes[19].backgroundColor = UIColor.white
        PianoKeysUI.notes[26].backgroundColor = UIColor.white
        
        // Showing B keys
        PianoKeysUI.notes[6].backgroundColor = UIColor.red
        PianoKeysUI.notes[13].backgroundColor = UIColor.red
        PianoKeysUI.notes[20].backgroundColor = UIColor.red
        PianoKeysUI.notes[27].backgroundColor = UIColor.red
        
        lessonModel.accumulateGoalIndex()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.step010(_:)))
        view.addGestureRecognizer(tap)
    }

    @objc func step010(_ sender: UITapGestureRecognizer? = nil) {
        lessonTextLabel.text = "That's it for Lesson 1. Great job! Memorize the placement of each white key and you will be ready for Lesson 2."
        lessonNumberLabel.text = "11 / 11"
        
        // Removing B keys
        PianoKeysUI.notes[6].backgroundColor = UIColor.white
        PianoKeysUI.notes[13].backgroundColor = UIColor.white
        PianoKeysUI.notes[20].backgroundColor = UIColor.white
        PianoKeysUI.notes[27].backgroundColor = UIColor.white
        
        lessonModel.accumulateGoalIndex()
    
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
