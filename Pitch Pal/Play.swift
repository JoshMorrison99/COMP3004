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
        
        let scene = PlayScene(size: view.bounds.size)
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsPhysics = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
}
