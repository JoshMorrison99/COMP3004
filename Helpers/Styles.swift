//
//  Styles.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 9/25/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit

extension UIButton{
    func pianoNoteStyle(){
        self.backgroundColor = UIColor.white
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    func pianoSharpStyle(){
        self.backgroundColor = UIColor.black
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
    func pianoPressedStyle(){
        self.backgroundColor = UIColor.init(red: 102/255, green: 252/255, blue: 240/255, alpha: 1.0)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitleColor(UIColor.black, for: .normal)
    }
}
