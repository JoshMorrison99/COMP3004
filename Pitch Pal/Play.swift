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
    
    // UI Piano
    @IBOutlet weak var Piano_C_1: UIButton!
    @IBOutlet weak var Piano_Cs_1: UIButton!
    @IBOutlet weak var Piano_D_1: UIButton!
    @IBOutlet weak var Piano_Ds_1: UIButton!
    @IBOutlet weak var Piano_E_1: UIButton!
    @IBOutlet weak var Piano_F_1: UIButton!
    @IBOutlet weak var Piano_Fs_1: UIButton!
    @IBOutlet weak var Piano_G_1: UIButton!
    @IBOutlet weak var Piano_Gs_1: UIButton!
    @IBOutlet weak var Piano_A_1: UIButton!
    @IBOutlet weak var Piano_As_1: UIButton!
    @IBOutlet weak var Piano_B_1: UIButton!
    
    // lines
    @IBOutlet weak var F_Line: UIView!
    @IBOutlet weak var D_Line: UIView!
    @IBOutlet weak var B_Line: UIView!
    @IBOutlet weak var G_Line: UIView!
    @IBOutlet weak var E_Line: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = PlayScene(size: view.bounds.size)
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
}
