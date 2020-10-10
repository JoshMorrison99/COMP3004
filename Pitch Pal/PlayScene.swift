//
//  PlayScene.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/6/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import SpriteKit
import AudioKit

class PlayScene : SKScene, SKPhysicsContactDelegate{
    
    let Notes = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    let EmptyNote = "#"
    let DiscardedNote = "-"
    
    var timer = Timer()
    var noteDetectionTimer = Timer()
    var noteDetectionTimerCycle:Double = 0.05
    
    var isOverlap = false
    
//    let noiseGateThreshold: Double = 0.1 // The threshold to determine at what loudness the microphone will begin picking up sound
//    let timerCycle:Double = 0.05 // the amount of time between each time the function to determinePitch() is called
//    let frequencyError:Double = 1 // the room for error on the frequency calculations
//
//    var mic: AKMicrophone!
//    var tracker: AKFrequencyTracker!
//    var silence: AKBooster!
//
//    let amplitudeDebugLabel = UILabel()
//    let frequencyDebugLabel = UILabel()
//    let pitchDetectionLabel = UILabel()
    
    let lineBitMask:UInt32 = 0b001
    let noteBitMask:UInt32 = 0b010
    

    override func didMove(to view: SKView) {
        
        setupUI()
        
        // Setup Staff UI
        StaffUI.shared.setupStaffUI(view: view)
        
        // Setup Piano UI
        PianoUI.shared.setupPianoUI(view: view)
        
        // Setup Pitch Detection
        PitchDetection.shared.initializePitchDetection()
        PitchDetection.shared.setupPitchDetection()
        
        physicsWorld.contactDelegate = self
        
        backgroundColor = UIColor.init(red: 47/255, green: 49/255, blue: 52/255, alpha: 1.0)
        
        
        createNoteDetectionLine()
        
        
        createMusicSheet()
        
    }
    
    func setupUI(){
        
        // Create the UI line
        let Gline = SKSpriteNode(imageNamed: "line")
        Gline.position = CGPoint(x: size.width * 0.5, y: size.height * 0.45)
        Gline.setScale(1.5)
        Gline.zRotation = (CGFloat(Double.pi / 2));
        Gline.name = "Gline"
        addChild(Gline)
        
        // Create the UI line
        let Bline = SKSpriteNode(imageNamed: "line")
        Bline.position = CGPoint(x: size.width * 0.5, y: size.height * 0.55)
        Bline.setScale(1.5)
        Bline.zRotation = (CGFloat(Double.pi / 2));
        Bline.name = "Bline"
        addChild(Bline)
        
        // Create the UI line
        let Dline = SKSpriteNode(imageNamed: "line")
        Dline.position = CGPoint(x: size.width * 0.5, y: size.height * 0.65)
        Dline.setScale(1.5)
        Dline.zRotation = (CGFloat(Double.pi / 2));
        Dline.name = "Dline"
        addChild(Dline)
        
        // Create the UI line
        let Eline = SKSpriteNode(imageNamed: "line")
        Eline.position = CGPoint(x: size.width * 0.5, y: size.height * 0.35)
        Eline.setScale(1.5)
        Eline.zRotation = (CGFloat(Double.pi / 2));
        Eline.name = "Gline"
        addChild(Eline)
        
        // Create the UI line
        let Fline = SKSpriteNode(imageNamed: "line")
        Fline.position = CGPoint(x: size.width * 0.5, y: size.height * 0.75)
        Fline.setScale(1.5)
        Fline.zRotation = (CGFloat(Double.pi / 2));
        Fline.name = "Fline"
        addChild(Fline)
    }
    
    func createMusicSheet(){
        
        var tempo:Double = 1
        var tempoIncrement:Double = 1
        createGNote()
        perform(#selector(createCNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createANote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createDNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createFNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        tempo = tempo + tempoIncrement
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBNote), with: nil, afterDelay: tempo)
    }
    
    
    
    func didEnd(_ contact: SKPhysicsContact) {
        isOverlap = false
        PitchDetection.shared.setLabel(newLabel: EmptyNote)
        //self.pitchDetectionLabel.text = EmptyNote
        
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        

        if (nodeA.name == "A" || nodeA.name == "B" || nodeA.name == "C" || nodeA.name == "D" || nodeA.name == "E" || nodeA.name == "F" || nodeA.name == "G"){
            nodeA.name = DiscardedNote // If the note passes the line, it will no longer be detected by collisions
        } else if (nodeB.name == "A" || nodeB.name == "B" || nodeB.name == "C" || nodeB.name == "D" || nodeB.name == "E" || nodeB.name == "F" || nodeB.name == "G"){
            nodeB.name = DiscardedNote // If the note passes the line, it will no longer be detected by collisions
        }
        overlap(contact, isOverlapping: isOverlap)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        isOverlap = true
        PitchDetection.shared.setLabel(newLabel: EmptyNote)
        overlap(contact, isOverlapping: isOverlap)
    }
    
    func overlap(_ contact: SKPhysicsContact, isOverlapping:Bool){
        print(contact)
        print(isOverlapping)
        if(isOverlapping == true){
            Timer.scheduledTimer(withTimeInterval: self.noteDetectionTimerCycle, repeats: true) { noteDetectionTimer in // Timer executes every 1/10 of a second
                
                    guard let nodeA = contact.bodyA.node else { return }
                    guard let nodeB = contact.bodyB.node else { return }
                    
                    

                if (nodeA.name == PitchDetection.shared.getLabel()){
                        self.collisionBetween(note: nodeA, object: nodeB)
                    } else if (nodeB.name == PitchDetection.shared.getLabel()){
                        self.collisionBetween(note: nodeB, object: nodeA)
                    }
            }
        }
    }
    
    func collisionBetween(note: SKNode, object: SKNode) {
        print("hello")
        if object.name == "line" {
            destroy(note: note)
        }
    }

    func destroy(note: SKNode) {
        note.removeFromParent()
    }
    
    func createNoteDetectionLine(){
        
        // Create the UI line
        let line = SKSpriteNode(imageNamed: "line")
        
        //Set the position of the line
        line.position = CGPoint(x: size.width * 0.2, y: size.height * 0.5)
        
        // Indentification
        line.name = "line"
        
        // Create a physics body arouond the line, so we can use 2d collision detection to detect notes
        line.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: line.size.width * 0.05, height: line.size.height))
        line.physicsBody?.isDynamic = false
        line.physicsBody!.contactTestBitMask = lineBitMask
        line.physicsBody!.collisionBitMask = lineBitMask
        line.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(line)
    }
    
    @objc func createGNote(){
        let note = SKSpriteNode(imageNamed: "musicnote")
        
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.5)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = "G"
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width * 0.5,height: note.size.height * 0.4))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
        
        // Determine speed of note
        let actualDuration = 10
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    @objc func createENote(){
        
        let note = SKSpriteNode(imageNamed: "musicnote")
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.4)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = "E"
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width * 0.5,height: note.size.height * 0.5))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
        
        // Determine speed of note
        let actualDuration = 10
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    @objc func createDNote(){
        let note = SKSpriteNode(imageNamed: "musicnote")
        
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.7)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = "D"
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width * 0.5,height: note.size.height * 0.5))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
        
        // Determine speed of note
        let actualDuration = 10
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    @objc func createFNote(){
        let note = SKSpriteNode(imageNamed: "musicnote")
        
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.8)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = "F"
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width * 0.5,height: note.size.height * 0.5))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
        
        // Determine speed of note
        let actualDuration = 10
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    @objc func createBNote(){
        let note = SKSpriteNode(imageNamed: "musicnote")
        
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.6)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = "B"
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width * 0.5,height: note.size.height * 0.5))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
        
        // Determine speed of note
        let actualDuration = 10
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    @objc func createANote(){
        let note = SKSpriteNode(imageNamed: "musicnote")
        
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.55)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = "A"
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width * 0.5,height: note.size.height * 0.5))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
        
        // Determine speed of note
        let actualDuration = 10
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    @objc func createCNote(){
        let note = SKSpriteNode(imageNamed: "musicnote")
        
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * 0.65)
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = "C"
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width * 0.5,height: note.size.height * 0.5))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
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
