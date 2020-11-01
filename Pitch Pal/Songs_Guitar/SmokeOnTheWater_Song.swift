//
//  SmokeOnTheWater_Song.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/31/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

extension PlayScene_Guitar {
    
    func SmokeOnTheWater_Song(){
        
        var tempo:Double = 0.75
        let tempoIncrement:Double = 0.75
        let secondToWaitAfterLastNote:Double = 6
        perform(#selector(createBigENote), with: "0", afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBigENote), with: "3", afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBigENote), with: "5", afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBigENote), with: "0", afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBigENote), with: "3", afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBigENote), with: "6", afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBigENote), with: "5", afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBigENote), with: "0", afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBigENote), with: "3", afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBigENote), with: "5", afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBigENote), with: "3", afterDelay: tempo)
        tempo = tempo + tempoIncrement
        perform(#selector(createBigENote), with: "0", afterDelay: tempo)
        tempo = tempo + secondToWaitAfterLastNote
        perform(#selector(endOfSong), with: nil, afterDelay: tempo)
    }
    
    func getTotalNotes() -> Int{
        return 12
    }
}
