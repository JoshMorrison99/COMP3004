//
//  PlayScene_Guitar.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/31/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import SpriteKit
import AudioKit

class PlayScene_Guitar : SKScene, SKPhysicsContactDelegate{
    
    let PitchDetectionManager: PitchDetection = PitchDetection()
    
    var noteSpeed = 6
    
    let noteHitLabel = SKLabelNode()
    
    let Notes = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B","C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    let EmptyNote = "#"
    let DiscardedNote = "-"
    
    var timer = Timer()
    var noteDetectionTimer = Timer()
    var noteDetectionTimerCycle:Double = 0.05
    
    var isOverlap = false
    var totalNotes = 0
    var notesHit = 0
    
    var staff = UIView()
    
    let BigEAxis:Double = 0.6
    let AAxis:Double = 0.5
    let DAxis:Double = 0.4
    let GAxis:Double = 0.3
    let BAxis:Double = 0.2
    let LittleEAxis:Double = 0.1
    
    let lineBitMask:UInt32 = 0b001
    let noteBitMask:UInt32 = 0b010
    

    override func didMove(to view: SKView) {
        
        setupUI()
        
        // Setup Staff UI
        //staff = GuitarTabUI.shared.setupStringUI(view: view)!
        //staff.backgroundColor = UIColor.init(red: 200/255, green: 200/255, blue: 200/255, alpha: 0.01)
        
        
        // Setup Pitch Detection
        PitchDetectionManager.initializePitchDetection()
        PitchDetectionManager.setupPitchDetection(isPiano: false)
        
        
        physicsWorld.contactDelegate = self
        
        backgroundColor = UIColor.init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        
        
        createNoteDetectionLine()
        
        
        SmokeOnTheWater_Song()
        
    }
    
    func setupUI(){
        
        // Create the UI for amount of notes the user has hit
        noteHitLabel.fontSize = 40
        noteHitLabel.position = CGPoint(x: size.width*0.9, y: size.height * 0.9)
        noteHitLabel.fontColor = .black
        noteHitLabel.text = String(notesHit) + "/" + String(getTotalNotes())
        addChild(noteHitLabel)
        
        // Create the UI line
        let BigEline = SKSpriteNode(imageNamed: "myLine")
        BigEline.position = CGPoint(x: size.width * 0.5, y: size.height * CGFloat(BigEAxis))
        BigEline.alpha = 1
        BigEline.setScale(0.5)
        BigEline.zPosition = -1
        BigEline.name = "BigEline"
        addChild(BigEline)
        
        // Create the UI line
        let Aline = SKSpriteNode(imageNamed: "myLine")
        Aline.position = CGPoint(x: size.width * 0.5, y: size.height * CGFloat(AAxis))
        Aline.alpha = 1
        Aline.setScale(0.5)
        Aline.zPosition = -1
        Aline.name = "Aline"
        addChild(Aline)
        
        // Create the UI line
        let Dline = SKSpriteNode(imageNamed: "myLine")
        Dline.position = CGPoint(x: size.width * 0.5, y: size.height * CGFloat(DAxis))
        Dline.alpha = 1
        Dline.setScale(0.5)
        Dline.zPosition = -1
        Dline.name = "Dline"
        addChild(Dline)
        
        // Create the UI line
        let Gline = SKSpriteNode(imageNamed: "myLine")
        Gline.position = CGPoint(x: size.width * 0.5, y: size.height * CGFloat(GAxis))
        Gline.alpha = 1
        Gline.zPosition = -1
        Gline.setScale(0.5)
        Gline.name = "Gline"
        addChild(Gline)
        
        // Create the UI line
        let Bline = SKSpriteNode(imageNamed: "myLine")
        Bline.position = CGPoint(x: size.width * 0.5, y: size.height * CGFloat(BAxis))
        Bline.alpha = 1
        Bline.setScale(0.5)
        Bline.zPosition = -1
        Bline.name = "Bline"
        addChild(Bline)
        
        // Create the UI line
        let LittleEline = SKSpriteNode(imageNamed: "myLine")
        LittleEline.position = CGPoint(x: size.width * 0.5, y: size.height * CGFloat(LittleEAxis))
        LittleEline.alpha = 1
        LittleEline.zPosition = -1
        LittleEline.setScale(0.5)
        LittleEline.name = "LittleEline"
        addChild(LittleEline)
    }
    
    
    // Called when contact ends between two physics bodies
    func didEnd(_ contact: SKPhysicsContact) {
        isOverlap = false
        PitchDetectionManager.setLabel(newLabel: EmptyNote)
        
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        

        if (nodeA.name == "A" || nodeA.name == "B" || nodeA.name == "C" || nodeA.name == "D" || nodeA.name == "E" || nodeA.name == "F" || nodeA.name == "G"){
            nodeA.name = DiscardedNote // If the note passes the line, it will no longer be detected by collisions
        } else if (nodeB.name == "A" || nodeB.name == "B" || nodeB.name == "C" || nodeB.name == "D" || nodeB.name == "E" || nodeB.name == "F" || nodeB.name == "G"){
            nodeB.name = DiscardedNote // If the note passes the line, it will no longer be detected by collisions
        }
        overlap(contact, isOverlapping: isOverlap)
    }
    
    @objc func endOfSong(){
        removeAllChildren()
        noteHitLabel.fontSize = 90
        noteHitLabel.position = CGPoint(x: size.width*0.5, y: size.height * 0.5)
        noteHitLabel.fontColor = .black
        noteHitLabel.text = String(notesHit) + "/" + String(getTotalNotes())
        addChild(noteHitLabel)
    }
    
    // Called when contact begins between two physics bodies
    func didBegin(_ contact: SKPhysicsContact) {
        isOverlap = true
        PitchDetectionManager.setLabel(newLabel: EmptyNote)
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
                    
                    

                if (nodeA.name == self.PitchDetectionManager.getLabel()){
                        self.collisionBetween(note: nodeA, object: nodeB)
                } else if (nodeB.name == self.PitchDetectionManager.getLabel()){
                        self.collisionBetween(note: nodeB, object: nodeA)
                    }
            }
        }
    }
    
    func collisionBetween(note: SKNode, object: SKNode) {
        print("hello")
        if object.name == "line" {
            destroy(note: note)
            notesHit+=1
            noteHitLabel.text = String(notesHit) + "/" + String(getTotalNotes())
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
    
    @objc func createGNote(pos: String){
        print("hey")
        let image = UIImage(systemName: pos+".circle")!.withTintColor(.red)

        let data = image.pngData()
        let newImage = UIImage(data:data!)
        let texture = SKTexture(image: newImage!)
        let note = SKSpriteNode(texture: texture,size: CGSize(width: 250, height: 250))
        
        //Set the position of the music note
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(GAxis))
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = Notes[Notes.firstIndex(of: "G")! + Int(pos)!]
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width,height: note.size.height))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(noteSpeed))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    @objc func createBigENote(pos: String){
        print(pos+".circle")
        let image = UIImage(systemName: pos+".circle")!.withTintColor(.red)

        let data = image.pngData()
        let newImage = UIImage(data:data!)
        let texture = SKTexture(image: newImage!)
        let note = SKSpriteNode(texture: texture,size: CGSize(width: 250, height: 250))
        
        //Set the position of the music note
        let noteYOffset = 0.09
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(BigEAxis+noteYOffset))
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        print(pos)
        print(Notes.firstIndex(of: "E")!)
        note.name = Notes[Notes.firstIndex(of: "E")! + Int(pos)!]
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width,height: note.size.height))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(noteSpeed))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    @objc func createANote(pos: String){
        let image = UIImage(systemName: pos+".circle")!.withTintColor(.red)

        let data = image.pngData()
        let newImage = UIImage(data:data!)
        let texture = SKTexture(image: newImage!)
        let note = SKSpriteNode(texture: texture,size: CGSize(width: 250, height: 250))
        
        //Set the position of the music note
        let noteYOffset = 0.09
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(AAxis+noteYOffset))
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = Notes[Notes.firstIndex(of: "A")! + Int(pos)!]
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width,height: note.size.height))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
    
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(noteSpeed))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    @objc func createDNote(pos: String){
        let image = UIImage(systemName: pos+".circle")!.withTintColor(.red)

        let data = image.pngData()
        let newImage = UIImage(data:data!)
        let texture = SKTexture(image: newImage!)
        let note = SKSpriteNode(texture: texture,size: CGSize(width: 250, height: 250))
        
        //Set the position of the music note
        let noteYOffset = 0.09
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(DAxis+noteYOffset))
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = Notes[Notes.firstIndex(of: "D")! + Int(pos)!]
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width,height: note.size.height))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(noteSpeed))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    @objc func createBNote(pos: String){
        let image = UIImage(systemName: pos+".circle")!.withTintColor(.red)

        let data = image.pngData()
        let newImage = UIImage(data:data!)
        let texture = SKTexture(image: newImage!)
        let note = SKSpriteNode(texture: texture,size: CGSize(width: 250, height: 250))
        
        //Set the position of the music note
        let noteYOffset = 0.09
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(BAxis+noteYOffset))
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = Notes[Notes.firstIndex(of: "B")! + Int(pos)!]
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width,height: note.size.height))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(noteSpeed))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    @objc func createLittleENote(pos: String){
        let image = UIImage(systemName: pos+".circle")!.withTintColor(.red)

        let data = image.pngData()
        let newImage = UIImage(data:data!)
        let texture = SKTexture(image: newImage!)
        let note = SKSpriteNode(texture: texture,size: CGSize(width: 250, height: 250))
        
        //Set the position of the music note
        let noteYOffset = 0.09
        note.position = CGPoint(x: size.width * 1.1, y: size.height * CGFloat(LittleEAxis+noteYOffset))
        
        // Scale the note to proper size
        note.setScale(0.15)
        
        // identification
        note.name = Notes[Notes.firstIndex(of: "E")! + Int(pos)!]
        
        // Create physics body for the note, so it can be detected by 2d collision
        note.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: note.size.width,height: note.size.height))
        note.physicsBody?.affectedByGravity = false
        note.physicsBody!.contactTestBitMask = lineBitMask
        note.physicsBody!.collisionBitMask = noteBitMask
        note.physicsBody!.categoryBitMask = lineBitMask
        
        addChild(note)
          
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -note.size.width/2, y: note.position.y),
                                         duration: TimeInterval(noteSpeed))
        
        let actionMoveDone = SKAction.removeFromParent()
        note.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
}

