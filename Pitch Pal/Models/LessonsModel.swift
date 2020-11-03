//
//  LessonsModel.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 11/3/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import Foundation

struct LessonsModel{
    
    private var lessonStepNumber: Int = 0
    
    func getLessonStepNum() -> Int{
        return lessonStepNumber
    }
    
    mutating func accumulateLessonStepNumber(){
        lessonStepNumber = lessonStepNumber + 1
    }
}
