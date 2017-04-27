//
//  Treasure.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/26/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

import Foundation

class Treasure{
    public let numTraps: Int
    
    init(){
        //Generate a percent
        let roll = Int(arc4random_uniform(UInt32(100)))
        
        
        //35% for 1 trap
        //30% for 2 traps
        //20% for 3 traps
        //10% for 4 traps
        //5% for 5 traps
        if roll > 0 && roll < 35{
            self.numTraps = 1
        }else if roll < 65{
            self.numTraps = 2
        }else if roll < 85{
            self.numTraps = 3
        }else if roll < 95{
            self.numTraps = 4
        }else{
            self.numTraps = 5
        }
    }
}
