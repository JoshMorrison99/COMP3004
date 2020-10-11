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
    
    var staff = UIView()
    
    let GAxis:Double = 0.43
    let BAxis:Double = 0.52
    let DAxis:Double = 0.61
    let EAxis:Double = 0.34
    let FAxis:Double = 0.70
    let AAxis:Double = 0.48
    let CAxis:Double = 0.56
    
    let lineBitMask:UInt32 = 0b001
    let noteBitMask:UInt32 = 0b010
    

    override func didMove(to view: SKView) {
        
        setupUI()
        
        // Setup Staff UI
        staff = StaffUI.shared.setupStaffUI(view: view)!
        staff.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
        
        // Setup Piano UI
        PianoUI.shared.setupPianoUI(view: view)
        
        
        // Setup Pitch Detection
        PitchDetection.shared.initializePitchDetection()
        PitchDetection.shared.setupPitchDetection()
        
        
        physicsWorld.contactDelegate = self
        
        backgroundColor = UIColor.init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        
        
        createNoteDetectionLine()
        
        
        createMusicSheet()
        
    }
    
    func setupUI(){
        
        // Create the UI line
        let Gline = SKSpriteNode(imageNamed: "line")
        Gline.position = CGPoint(x: size.width * 0.5, y: size.height * CGFloat(GAxis))
        Gline.setScale(1.5)
        Gline.alpha = 0
        Gline.zRotation = (CGFloat(Double.pi / 2));
        Gline.zPosition = 1000
        Gline.name = "Gline"
        addChild(Gline)
        
        // Create the UI line
        let Bline = SKSpriteNode(imageNamed: "line")
        Bline.position = CGPoint(x: size.width * 0.5, y: size.height * CGFloat(BAxis))
        Bline.setScale(1.5)
        Bline.alpha = 0
        Bline.zRotation = (CGFloat(Double.pi / 2));
        Bline.zPosition = 1000
        Bline.name = "Bline"
        addChild(Bline)
        
        // Create the UI line
        let Dline = SKSpriteNode(imageNamed: "line")
        Dline.position = CGPoint(x: size.width * 0.5, y: size.height * CGFloat(DAxis))
        Dline.setScale(1.5)
        Dline.alpha = 0
        Dline.zRotation = (CGFloat(Double.pi / 2));
        Dline.name = "Dline"
        addChild(Dline)
        
        // Create the UI line
        let Eline = SKSpriteNode(imageNamed: "line")
        Eline.position = CGPoint(x: size.width * 0.5, y: size.height * CGFloat(EAxis))
        Eline.setScale(1.5)
        Eline.alpha = 0
        Eline.zRotation = (CGFloat(Double.pi / 2));
        Eline.name = "Gline"
        addChild(Eline)
        
        // Create the UI line
        let Fline = SKSpriteNode(imageNamed: "line")
        Fline.position = CGPoint(x: size.width * 0.5, y: size.height * CGFloat(FAxis))
        Fline.setScale(1.5)
        Fline.alpha = 0
        Fline.zRotation = (CGFloat(Double.pi / 2));
        Fline.name = "Fline"
        addChild(Fline)
    }
    
    func createMusicSheet(){
        
        var tempo:Double = 1
        let tempoIncrement:Double = 1
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createDNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createDNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createDNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        tempo = tempo + tempoIncrement
        perform(#selector(createCNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createCNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createANote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createANote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        tempo = tempo + tempoIncrement
    }
    
    
    // Called when contact ends between two physics bodies
    func didEnd(_ contact: SKPhysicsContact) {
        isOverlap = false
        PitchDetection.shared.setLabel(newLabel: EmptyNote)
        
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        

        if (nodeA.name == "A" || nodeA.name == "B" || nodeA.name == "C" || nodeA.name == "D" || nodeA.name == "E" || nodeA.name == "F" || nodeA.name == "G"){
            nodeA.name = DiscardedNote // If the note passes the line, it will no longer be detected by collisions
        } else if (nodeB.name == "A" || nodeB.name == "B" || nodeB.name == "C" || nodeB.name == "D" || nodeB.name == "E" || nodeB.name == "F" || nodeB.name == "G"){
            nodeB.name = DiscardedNote // If the note passes the line, it will no longer be detected by collisions
        }
        overlap(contact, isOverlapping: isOverlap)
    }
    
    // Called when contact begins between two physics bodies
    func didBegin(_ contact: SKPhysicsContact) {
        isOverlap = true
        PitchDetection.shared.setLabel(newLabel: EmptyNote)
        overlap(contact, isOverlapping: isOverlap)
    }
    
    // Called in the interval from when the 2 physics bodies collide and when they end.
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
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(GAxis+0.05))
        
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
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(EAxis+0.05))
        
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
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(DAxis+0.06))
        
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
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(FAxis+0.07))
        
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
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(BAxis+0.05))
        
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
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(AAxis+0.05))
        
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
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(CAxis+0.06))
        
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
