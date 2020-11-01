//
//  PianoUI.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/10/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit

class PianoUI {
    
    static let shared = PianoUI()

    let whiteNotes = ["C","D","E","F","G","A","B","C","D","E","F","G","A","B","C","D","E","F","G","A","B","C","D","E","F","G","A","B"]
    var notes: [UIButton]!
    
    var stackView = UIStackView()

    func setupPianoUI(view: UIView){
        
        notes = Array(0..<whiteNotes.count).map { (index) -> UIButton in
            let note = UIButton()
            note.backgroundColor = UIColor.white
            note.translatesAutoresizingMaskIntoConstraints = false

            return note
        }
        
        stackView = UIStackView(arrangedSubviews: notes)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis = .horizontal
        stackView.spacing = 1.0
        stackView.distribution = .fillEqually

        view.addSubview(stackView)

        //stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // Sample white note
        let note = notes.first!

        // LayoutGuide
        let leadingLayoutGuide = UILayoutGuide()
        view.addLayoutGuide(leadingLayoutGuide)
        leadingLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        leadingLayoutGuide.widthAnchor.constraint(equalTo: note.widthAnchor, multiplier: 2/3).isActive = true

        let trailingLayoutGuide = UILayoutGuide()
        view.addLayoutGuide(trailingLayoutGuide)
        trailingLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        trailingLayoutGuide.widthAnchor.constraint(equalTo: note.widthAnchor, multiplier: 2/3).isActive = true

        // StackView
        let stackViewB = UIStackView()
        stackViewB.translatesAutoresizingMaskIntoConstraints = false

        stackViewB.axis = .horizontal
        stackViewB.distribution = .equalSpacing

        view.addSubview(stackViewB)

        stackViewB.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        //stackViewB.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackViewB.leadingAnchor.constraint(equalTo: leadingLayoutGuide.trailingAnchor).isActive = true
        stackViewB.trailingAnchor.constraint(equalTo: trailingLayoutGuide.leadingAnchor).isActive = true
        //stackViewB.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stackViewB.heightAnchor.constraint(equalTo: note.heightAnchor, multiplier: 2/3).isActive = true

        // Black note
        for i in 0..<whiteNotes.count-1 {
            let blackNote = UIButton()
            blackNote.backgroundColor = UIColor.black
            stackViewB.addArrangedSubview(blackNote)

            // Hide Mi-Fa black note
            if i == 2 || i == 6 || i == 9 || i == 13 || i == 16 || i == 20 || i == 23 || i == 27{
                blackNote.alpha = 0
            }else{
                notes.append(blackNote)
            }

            blackNote.widthAnchor.constraint(equalTo: note.widthAnchor, multiplier: 2/3).isActive = true
        }
        print(notes)
    }
    
    func pianoKeyPressedUI(pitchDetectionLabel: String){
        //notes = PianoUI.shared.setupPianoUI(view: view)
        clearPianoUI()
        if(pitchDetectionLabel == "C"){
            notes[0].backgroundColor = UIColor.red
            notes[7].backgroundColor = UIColor.red
            notes[14].backgroundColor = UIColor.red
            notes[21].backgroundColor = UIColor.red
        }else if(pitchDetectionLabel == "C#"){
            notes[28].backgroundColor = UIColor.red
            notes[33].backgroundColor = UIColor.red
            notes[38].backgroundColor = UIColor.red
            notes[43].backgroundColor = UIColor.red
        }else if(pitchDetectionLabel == "D"){
            notes[1].backgroundColor = UIColor.red
            notes[8].backgroundColor = UIColor.red
            notes[15].backgroundColor = UIColor.red
            notes[22].backgroundColor = UIColor.red
        }else if(pitchDetectionLabel == "D#"){
            notes[29].backgroundColor = UIColor.red
            notes[34].backgroundColor = UIColor.red
            notes[39].backgroundColor = UIColor.red
            notes[44].backgroundColor = UIColor.red
        }else if(pitchDetectionLabel == "E"){
            notes[2].backgroundColor = UIColor.red
            notes[9].backgroundColor = UIColor.red
            notes[16].backgroundColor = UIColor.red
            notes[23].backgroundColor = UIColor.red
        }else if(pitchDetectionLabel == "F"){
            notes[3].backgroundColor = UIColor.red
            notes[10].backgroundColor = UIColor.red
            notes[17].backgroundColor = UIColor.red
            notes[24].backgroundColor = UIColor.red
        }else if(pitchDetectionLabel == "F#"){
            notes[30].backgroundColor = UIColor.red
            notes[35].backgroundColor = UIColor.red
            notes[40].backgroundColor = UIColor.red
            notes[45].backgroundColor = UIColor.red
        }else if(pitchDetectionLabel == "G"){
            notes[4].backgroundColor = UIColor.red
            notes[11].backgroundColor = UIColor.red
            notes[18].backgroundColor = UIColor.red
            notes[25].backgroundColor = UIColor.red
        }else if(pitchDetectionLabel == "G#"){
            notes[31].backgroundColor = UIColor.red
            notes[36].backgroundColor = UIColor.red
            notes[41].backgroundColor = UIColor.red
            notes[46].backgroundColor = UIColor.red
        }else if(pitchDetectionLabel == "A"){
            notes[5].backgroundColor = UIColor.red
            notes[12].backgroundColor = UIColor.red
            notes[19].backgroundColor = UIColor.red
            notes[26].backgroundColor = UIColor.red
        }else if(pitchDetectionLabel == "A#"){
            notes[32].backgroundColor = UIColor.red
            notes[37].backgroundColor = UIColor.red
            notes[42].backgroundColor = UIColor.red
            notes[47].backgroundColor = UIColor.red
        }else if(pitchDetectionLabel == "B"){
            notes[6].backgroundColor = UIColor.red
            notes[13].backgroundColor = UIColor.red
            notes[20].backgroundColor = UIColor.red
            notes[27].backgroundColor = UIColor.red
        }
    }
    
    func clearPianoUI(){
        for each in 0..<notes.count{
            if(each > 27){
                notes[each].pianoBlackStyle()
            }else{
                notes[each].pianoWhiteStyle()
            }
        }
    }
}
