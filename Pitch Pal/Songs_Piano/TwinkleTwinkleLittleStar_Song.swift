//
//  TwinkleTwinkleLittleStar_Song.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/27/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

extension PlayScene {
    
    func TwinkeTwinkle_Song(){
        print("Hello")
        
        var tempo:Double = 0.75
        let tempoIncrement:Double = 0.75
        perform(#selector(createCNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createCNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createANote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createANote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        tempo = tempo + tempoIncrement
        perform(#selector(createFNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createFNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createDNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createDNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createCNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        tempo = tempo + tempoIncrement
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createFNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createFNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createDNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        tempo = tempo + tempoIncrement
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createFNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createFNote), with: nil, afterDelay: tempo)
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
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createANote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createANote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        tempo = tempo + tempoIncrement
        perform(#selector(createFNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createFNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createDNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createDNote), with: nil, afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createCNote), with: nil, afterDelay: tempo)
    }
    
    func getTotalNotes() -> Int{
        return 42
    }
}
