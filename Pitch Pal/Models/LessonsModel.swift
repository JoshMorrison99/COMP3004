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
    private var LessonGoalNote: [String] = []
    private var goalNote: String = ""
    private var goalIndex = 0
    private var timerLoop = 0.25
    private var startLessonPlay: Bool = false
    
    func getLessonStepNum() -> Int{
        return lessonStepNumber
    }
    
    mutating func accumulateLessonStepNumber(){
        lessonStepNumber = lessonStepNumber + 1
    }
    
    mutating func startLesson(){
        startLessonPlay = true
    }
    
    func getTimer() -> Double{
        return timerLoop
    }
    
    func getGoalIndex() -> Int {
        return goalIndex
    }
    
    func getGoalNote() -> String {
        return goalNote
    }
    
    func getLessonGoalNote() -> [String] {
        return LessonGoalNote
    }
    
    mutating func setGoalNote(newGoalNote: String){
        goalNote = newGoalNote
    }
    
    mutating func setLessonGoalNote(lessonNotes: [String]){
        LessonGoalNote = lessonNotes
    }
    
    mutating func accumulateGoalIndex(){
        goalIndex = goalIndex + 1
    }
    
    mutating func setTimer(newTimer: Double){
        timerLoop = newTimer
    }
}
