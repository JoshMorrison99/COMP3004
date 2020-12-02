//
//  MainMenuPiano.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 12/2/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import Foundation
import UIKit

class MainMenuPiano: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var settingsBtn: UIButton!
    
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    
    @IBOutlet weak var closeBtn: UIButton!
    
    override func viewDidLoad() {
        settingsView.isHidden = true
        noisePressed()
    }
    
    @IBAction func settingsBtnPressed(_ sender: Any) {
        settingsView.isHidden = false
    }
    
    @IBAction func noiseGate1Pressed(_ sender: Any) {
        defaults.set(1, forKey: "NoiseGate")
        noisePressed()
    }
    
    @IBAction func noiseGate2Pressed(_ sender: Any) {
        defaults.set(2, forKey: "NoiseGate")
        noisePressed()
    }
    
    
    @IBAction func noiseGate3Pressed(_ sender: Any) {
        defaults.set(3, forKey: "NoiseGate")
        noisePressed()
    }
    
    @IBAction func noiseGate4pressed(_ sender: Any) {
        defaults.set(4, forKey: "NoiseGate")
        noisePressed()
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        settingsView.isHidden = true
    }
    
    func noisePressed(){
        if(defaults.integer(forKey: "NoiseGate") == 1){
            one.backgroundColor = UIColor.red
            two.backgroundColor = UIColor.white
            three.backgroundColor = UIColor.white
            four.backgroundColor = UIColor.white
        }else if(defaults.integer(forKey: "NoiseGate") == 2){
            two.backgroundColor = UIColor.red
            one.backgroundColor = UIColor.white
            three.backgroundColor = UIColor.white
            four.backgroundColor = UIColor.white
        }else if(defaults.integer(forKey: "NoiseGate") == 3){
            three.backgroundColor = UIColor.red
            one.backgroundColor = UIColor.white
            two.backgroundColor = UIColor.white
            four.backgroundColor = UIColor.white
        }else if(defaults.integer(forKey: "NoiseGate") == 4){
            four.backgroundColor = UIColor.red
            two.backgroundColor = UIColor.white
            three.backgroundColor = UIColor.white
            one.backgroundColor = UIColor.white
        }else{
            print("that's tough...")
        }
    }
    
}
