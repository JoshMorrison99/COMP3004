//
//  OdeToJoy_Song.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 11/3/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

extension PlayScene {
    
    func OdeToJoy_Song(){
        
        var tempo:Double = 0
        let secondToWaitAfterLastNote:Double = 6
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + 0.5
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + 0.5
        perform(#selector(createFNote), with: nil, afterDelay: tempo)
        tempo = tempo + 0.5
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + 0.5
        perform(#selector(createGNote), with: nil, afterDelay: tempo)
        tempo = tempo + 0.5
        perform(#selector(createFNote), with: nil, afterDelay: tempo)
        tempo = tempo + 0.5
        perform(#selector(createENote), with: nil, afterDelay: tempo)
        tempo = tempo + 0.5
        perform(#selector(createDNote), with: nil, afterDelay: tempo)
        tempo = tempo + secondToWaitAfterLastNote
        perform(#selector(endOfSong), with: nil, afterDelay: tempo)
    }
    
    func getTotalNotes_OdeToJoy() -> Int{
        return 8
    }
}
