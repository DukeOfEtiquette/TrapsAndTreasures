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
        self.numTraps = Int(arc4random_uniform(UInt32(3)))
    }
}
