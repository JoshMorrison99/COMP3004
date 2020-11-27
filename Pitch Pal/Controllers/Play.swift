//
//  Play.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 9/29/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import SpriteKit
import AudioKit

class Play: UIViewController {
    
    @IBOutlet weak var pauseBtn: UIButton!
    
    @IBOutlet weak var pauseView: UIView!
    
    var songSelectionIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseView.isHidden = true
        
        let scene = PlayScene(size: view.bounds.size)
        scene.songIndex = songSelectionIndex
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        //skView.showsPhysics = true            // Uncomment this to view physics bounding boxes on the UI
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        
    }
    
    @IBAction func pauseBtnClicked(_ sender: Any) {
        view.bringSubviewToFront(pauseView)
        pauseView.isHidden = false
    }
    @IBAction func yesBtnClicked(_ sender: Any) {
        do {
            try AKManager.stop()
        }catch{
                print("Error: AudioKit cannot be stopped...")
        }
    }
    @IBAction func noBtnClicked(_ sender: Any) {
        pauseView.isHidden = true
    }
    
}
