//
//  PauseMenuUI.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 11/3/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import AudioKit

class PauseMenuUI {
    
    // Pause Menu
    var pauseMenu = UIView()
    
    // Pause Button Stackview
    var pauseBtnStack = UIStackView()
    
    // Pause Menu Title
    var pauseTitle = UILabel()
    
    // Pause Button
    var pauseButton = UIButton()
    var pauseMenu_Yes_Btn = UIButton()
    var pauseMenu_No_Btn = UIButton()
    
    func AddPauseMenu(view: UIView){
        
        // Setup pause title
        pauseTitle.text = "Main Menu?"
        pauseTitle.textAlignment = .center
        pauseTitle.textColor = .black
        pauseTitle.adjustsFontForContentSizeCategory = true
        pauseTitle.font = pauseTitle.font.withSize(60)
        pauseTitle.font = UIFont.boldSystemFont(ofSize: 40)
        
        // Setup yes / no btn
        pauseMenu_Yes_Btn.setTitle("Yes", for: .normal)
        pauseMenu_Yes_Btn.setTitleColor(.black, for: .normal)
        pauseMenu_Yes_Btn.titleLabel?.font = pauseMenu_Yes_Btn.titleLabel?.font.withSize(30)
        
        pauseMenu_No_Btn.setTitle("No", for: .normal)
        pauseMenu_No_Btn.setTitleColor(.black, for: .normal)
        pauseMenu_No_Btn.titleLabel?.font = pauseMenu_No_Btn.titleLabel?.font.withSize(30)
        
        // Setup stack view
        pauseBtnStack.addArrangedSubview(pauseMenu_Yes_Btn)
        pauseBtnStack.addArrangedSubview(pauseMenu_No_Btn)
        pauseBtnStack.axis = .vertical
        pauseBtnStack.alignment = .fill
        pauseBtnStack.spacing = 0
        pauseBtnStack.distribution = .fillEqually
        
        // Setup pause menu btn
        let pauseImg = UIImage(systemName: "house.circle")
        pauseButton.setBackgroundImage(pauseImg, for: .normal)
        pauseImg?.withTintColor(.white)
        pauseButton.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
        
        // Setup Pause menu btn clicks
        pauseButton.addTarget(self, action: #selector(pauseButtonClicked), for: .touchUpInside)
        pauseMenu_Yes_Btn.addTarget(self, action: #selector(pauseYesButtonClicked), for: .touchUpInside)
        pauseMenu_No_Btn.addTarget(self, action: #selector(pauseNoButtonClicked), for: .touchUpInside)
        
        // Setup pause view
        pauseMenu.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.8)
        
        // Setup pause menu btn constraints
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pauseButton)
        pauseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pauseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        // Setup pause menu constraints
        pauseMenu.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pauseMenu)
        pauseMenu.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        pauseMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        pauseMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        pauseMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        
        
        // Setup pause title constraints
        pauseTitle.translatesAutoresizingMaskIntoConstraints = false
        pauseMenu.addSubview(pauseTitle)
        pauseTitle.topAnchor.constraint(equalTo: pauseMenu.topAnchor, constant: 20).isActive = true
        pauseTitle.trailingAnchor.constraint(equalTo: pauseMenu.trailingAnchor, constant: 0).isActive = true
        pauseTitle.leadingAnchor.constraint(equalTo: pauseMenu.leadingAnchor, constant: 0).isActive = true
        
        // Setup stack view constraints
        pauseBtnStack.translatesAutoresizingMaskIntoConstraints = false
        pauseMenu.addSubview(pauseBtnStack)
        pauseBtnStack.topAnchor.constraint(equalTo: pauseTitle.bottomAnchor, constant: 10).isActive = true
        pauseBtnStack.bottomAnchor.constraint(equalTo: pauseMenu.bottomAnchor, constant: -100).isActive = true
        pauseBtnStack.trailingAnchor.constraint(equalTo: pauseMenu.trailingAnchor, constant: 0).isActive = true
        pauseBtnStack.leadingAnchor.constraint(equalTo: pauseMenu.leadingAnchor, constant: 0).isActive = true
        
        
    }
    
    @objc func pauseYesButtonClicked(){
        do {
            try AKManager.stop()
        }catch{
            print("Error: AudioKit cannot be stopped...")
        }
    }
    
    @objc func pauseNoButtonClicked(_ sender: Any) {
        self.pauseMenu.isHidden = true
    }
    
    @objc func pauseButtonClicked(){
        pauseMenu.isHidden = false
    }
    
    
}
