//
//  Eden - Rock and Roll.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 11/16/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

extension PlayScene_Guitar{
    
    
    func RockAndRoll_Song(){
        
        var tempo:Double = 0
        let secondToWaitAfterLastNote:Double = 6
        perform(#selector(createBigENote), with: "4", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createGNote), with: "5", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createBigENote), with: "4", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createGNote), with: "5", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createBigENote), with: "11", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createGNote), with: "12", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createBigENote), with: "11", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createGNote), with: "12", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createBigENote), with: "6", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createGNote), with: "7", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createBigENote), with: "6", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createGNote), with: "7", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createBigENote), with: "8", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createGNote), with: "8", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createBigENote), with: "8", afterDelay: tempo)
        tempo = tempo + 0.7
        perform(#selector(createGNote), with: "8", afterDelay: tempo)
        tempo = tempo + secondToWaitAfterLastNote
        perform(#selector(endOfSong), with: nil, afterDelay: tempo)
    }
    
    func getTotalNotes_Rock() -> Int{
        return 16
    }
}
