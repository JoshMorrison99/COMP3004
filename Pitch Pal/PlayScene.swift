//
//  PlayScene.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/6/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import SpriteKit

class PlayScene : SKScene{

    override func didMove(to view: SKView) {
        backgroundColor = SKColor.green
        createGNote()
        createENote()
        createDNote()
        createFNote()
        createBNote()
        
    }
    
    func createGNote(){
        let note = SKSpriteNode(imageNamed: "musicnote")
        
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.6)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        addChild(note)
        
        // Determine speed of note
        let actualDuration = 10
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func createENote(){
        
        let note = SKSpriteNode(imageNamed: "musicnote")
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.4)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        addChild(note)
        
        // Determine speed of note
        let actualDuration = 10
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func createDNote(){
        let note = SKSpriteNode(imageNamed: "musicnote")
        
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.7)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        addChild(note)
        
        // Determine speed of note
        let actualDuration = 10
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func createFNote(){
        let note = SKSpriteNode(imageNamed: "musicnote")
        
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.8)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        addChild(note)
        
        // Determine speed of note
        let actualDuration = 10
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func createBNote(){
        let note = SKSpriteNode(imageNamed: "musicnote")
        
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.5)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        addChild(note)
        
        // Determine speed of note
        let actualDuration = 10
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
}
