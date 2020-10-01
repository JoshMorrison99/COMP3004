//
//  Play.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 9/29/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import SpriteKit

class Play: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = PlayScene(size: view.bounds.size)
            
            
        }
    }
}
