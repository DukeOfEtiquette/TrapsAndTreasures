//
//  MovementTrap.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/26/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

import Foundation

class MovementTrap{
    var name: String
    var penalty: Int
    
    init(){
        //Set a random value between 1 and 3
        self.penalty = Int(arc4random_uniform(UInt32(3))) + 1
        
        //Based on the penalty give the trap a unique name
        switch penalty {
        case 1:
            self.name = "Minor"
        case 2:
            self.name = "Major"
        case 3:
            self.name = "Massive"
        default:
            self.name = "Super Dupe Ultra-Secret Rare"
        }
        
        self.name += " Movement Trap"
    }
}
