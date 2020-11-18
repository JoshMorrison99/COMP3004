//
//  Tuner.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/10/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit


class TunerController: UIViewController, Subscriber {
    
    @IBOutlet weak var tunerLabel: UILabel!
    
    @IBOutlet weak var pauseMenu: UIView!
    @IBOutlet weak var pauseYesBtn: UIButton!
    @IBOutlet weak var pauseNoBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    var PitchDetectionManager = PitchDetection()
    var id = Int()
    
    func initialize(PitchDetectionManager : PitchDetection, id : Int) {
        self.PitchDetectionManager = PitchDetectionManager
        self.PitchDetectionManager.addSubscriber(subscriber: self)
        self.id = id
    }
    
    func update() {
        tunerLabel.text = PitchDetectionManager.pitchLabel
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize(PitchDetectionManager: PitchDetectionManager, id: 0)
        
        self.pauseMenu.isHidden = true
        
        self.PitchDetectionManager.initializePitchDetection()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.PitchDetectionManager.setupPitchDetection()
        
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            self.tunerLabel.text = self.tunerLabel.text
        }
    }
    
    @IBAction func pauseYesBtnClicked(_ sender: Any) {
        do {
            try AKManager.stop()
        }catch{
                print("Error: AudioKit cannot be stopped...")
        }
    }
    
    @IBAction func pauseNoBtnClicked(_ sender: Any) {
        self.pauseMenu.isHidden = true
    }
    
    @IBAction func pauseBtnClicked(_ sender: Any) {
        view.bringSubviewToFront(pauseMenu)
        pauseMenu.isHidden = false
    }
    
    
}
