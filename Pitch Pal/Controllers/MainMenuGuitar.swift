//
//  MainMenuGuitar.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 12/2/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import Foundation
import UIKit

class MainMenuGuitar: UIViewController {
    @IBOutlet weak var settingsView: UIView!
    
    @IBOutlet weak var settingsBtn: UIButton!
    
    override func viewDidLoad() {
        settingsView.isHidden = true
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        settingsView.isHidden = true
    }
    
    @IBAction func settingsBtnPressed(_ sender: Any) {
        settingsView.isHidden = false
    }
    
    @IBAction func noiseGate1Pressed(_ sender: Any) {
    }
    
    @IBAction func noiseGate2Pressed(_ sender: Any) {
    }
    
    @IBAction func noiseGate3Pressed(_ sender: Any) {
    }
    
    @IBAction func noiseGate4Pressed(_ sender: Any) {
    }
    
}

