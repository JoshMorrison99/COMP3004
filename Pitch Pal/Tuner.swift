//
//  Tuner.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/10/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit

class Tuner: UIViewController {
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StaffUI.shared.setupStaffUI(view: view)
        PianoUI.shared.setupPianoUI(view: view)
        PitchDetection.shared.initializePitchDetection()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        PitchDetection.shared.setupPitchDetection()
    }
    
}
