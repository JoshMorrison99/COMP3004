//
//  Tuner.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/10/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit

class Tuner: UIViewController {
    
    @IBOutlet weak var tunerLabel: UILabel!
    
    @IBOutlet weak var pauseMenu: UIView!
    @IBOutlet weak var pauseYesBtn: UIButton!
    @IBOutlet weak var pauseNoBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pauseMenu.isHidden = true
        
        PitchDetection.shared.initializePitchDetection()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        PitchDetection.shared.setupPitchDetection(isPiano: false)
        
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            self.tunerLabel.text = PitchDetection.shared.getLabel()
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
