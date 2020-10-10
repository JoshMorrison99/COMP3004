//
//  Styles.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 9/25/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit

extension UIButton{
    func pianoWhiteStyle(){
        self.backgroundColor = UIColor.white
    }
    
    func pianoBlackStyle(){
        self.backgroundColor = UIColor.black
    }
    
    func pianoPressedStyle(){
        self.backgroundColor = UIColor.init(red: 102/255, green: 252/255, blue: 240/255, alpha: 1.0)
    }
}

extension UIView{
    func viewBackgroundColor(){
        self.backgroundColor = UIColor.init(red: 47/255, green: 49/255, blue: 52/255, alpha: 1.0)
    }
}
