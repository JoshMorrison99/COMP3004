//
//  Subscriber.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 11/18/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

protocol Subscriber {
    var id : Int{get}
    func update()
}
