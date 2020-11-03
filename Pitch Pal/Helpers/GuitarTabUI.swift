//
//  GuitarTabUI.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/29/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit

class GuitarTabUI {
    
    let strings = UIView()
    let stringsStack = UIStackView()
    let BigELine = UIView()
    let ALine = UIView()
    let DLine = UIView()
    let GLine = UIView()
    let BLine = UIView()
    let LittleELine = UIView()
    
    func setupStringUI(view: UIView) -> UIView?{
        
        // Line Logic
        BigELine.backgroundColor = .black
        ALine.backgroundColor = .black
        DLine.backgroundColor = .black
        GLine.backgroundColor = .black
        BLine.backgroundColor = .black
        LittleELine.backgroundColor = .black
        
        
        stringsStack.addArrangedSubview(LittleELine)
        stringsStack.addArrangedSubview(BLine)
        stringsStack.addArrangedSubview(GLine)
        stringsStack.addArrangedSubview(DLine)
        stringsStack.addArrangedSubview(ALine)
        stringsStack.addArrangedSubview(BigELine)
        
        // staffStack logic
        stringsStack.axis = .vertical
        stringsStack.spacing = 27.0
        stringsStack.distribution = .fillEqually
        
        
        // staffStack constraints
        stringsStack.translatesAutoresizingMaskIntoConstraints = false
        strings.addSubview(stringsStack)
        stringsStack.topAnchor.constraint(equalTo: strings.topAnchor, constant: 0).isActive = true
        stringsStack.bottomAnchor.constraint(equalTo: strings.bottomAnchor, constant: 0).isActive = true
        stringsStack.trailingAnchor.constraint(equalTo: strings.trailingAnchor, constant: 0).isActive = true
        stringsStack.leadingAnchor.constraint(equalTo: strings.leadingAnchor, constant: 0).isActive = true
        
        
        strings.backgroundColor = .white
        strings.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(strings)
        strings.heightAnchor.constraint(equalToConstant: 150).isActive = true
        strings.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        strings.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        strings.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        return strings
    }
    
    func getBigELine() -> UIView{
        return BigELine
    }
    
    func getALine() -> UIView{
        return ALine
    }
    
    func getDLine() -> UIView{
        return DLine
    }
    
    func getGLine() -> UIView{
        return GLine
    }
    
    func getBLine() -> UIView{
        return BLine
    }
    
    func getLittleELine() -> UIView{
        return LittleELine
    }
    
    func getStrings() -> UIView{
        return strings
    }
}
