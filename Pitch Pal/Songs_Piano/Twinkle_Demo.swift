//
//  TwinkleTwinkleLittleStar_Song.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/27/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

extension PlayScene {
    
    func Twinke_Demo(){
        
        var tempo:Double = 0.75
        let tempoIncrement:Double = 0.75
        let secondToWaitAfterLastNote:Double = 6
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
        tempo = tempo + secondToWaitAfterLastNote
        perform(#selector(endOfSong), with: nil, afterDelay: tempo)
    }
    
    func getTotalNotes_Demo() -> Int{
        return 7
    }
}
