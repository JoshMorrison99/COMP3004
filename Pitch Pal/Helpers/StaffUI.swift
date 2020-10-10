//
//  StaffUI.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 10/10/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit

class StaffUI {
    
    static let shared = StaffUI()
    
    let staff = UIView()
    let staffStack = UIStackView()
    let ELine = UIView()
    let GLine = UIView()
    let BLine = UIView()
    let DLine = UIView()
    let FLine = UIView()
    let trebleClef = UIImageView()
    
    func setupStaffUI(view: UIView){
        
        // Line Logic
        FLine.backgroundColor = .black
        GLine.backgroundColor = .black
        ELine.backgroundColor = .black
        BLine.backgroundColor = .black
        DLine.backgroundColor = .black
        
        
        staffStack.addArrangedSubview(FLine)
        staffStack.addArrangedSubview(DLine)
        staffStack.addArrangedSubview(BLine)
        staffStack.addArrangedSubview(GLine)
        staffStack.addArrangedSubview(ELine)
        trebleClef.image = UIImage(named: "trebleClef")
        
        // staffStack logic
        staffStack.axis = .vertical
        staffStack.spacing = 30.0
        staffStack.distribution = .fillEqually
        
        
        // staffStack constraints
        staffStack.translatesAutoresizingMaskIntoConstraints = false
        staff.addSubview(staffStack)
        staffStack.topAnchor.constraint(equalTo: staff.topAnchor, constant: 0).isActive = true
        staffStack.bottomAnchor.constraint(equalTo: staff.bottomAnchor, constant: 0).isActive = true
        staffStack.trailingAnchor.constraint(equalTo: staff.trailingAnchor, constant: 0).isActive = true
        staffStack.leadingAnchor.constraint(equalTo: staff.leadingAnchor, constant: 0).isActive = true
        
        
        staff.backgroundColor = .white
        staff.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(staff)
        staff.heightAnchor.constraint(equalToConstant: 150).isActive = true
        staff.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        staff.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        staff.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        // trebleClef constraints
        trebleClef.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trebleClef)
        trebleClef.bottomAnchor.constraint(equalTo: staff.bottomAnchor, constant: 35).isActive = true
        trebleClef.widthAnchor.constraint(equalToConstant: 125).isActive = true
        trebleClef.heightAnchor.constraint(equalToConstant: 200).isActive = true
        trebleClef.leadingAnchor.constraint(equalTo: staff.leadingAnchor, constant: -10).isActive = true
        
        view.sendSubviewToBack(staff)
        
    }
    
    func getGLine() -> UIView{
        return GLine
    }
    
    func getFLine() -> UIView{
        return FLine
    }
    
    func getDLine() -> UIView{
        return DLine
    }
    
    func getBLine() -> UIView{
        return BLine
    }
    
    func getELine() -> UIView{
        return ELine
    }
    
    func getStaff() -> UIView{
        return staff
    }
    
    func getTrebleClef() -> UIImageView{
        return trebleClef
    }
}
