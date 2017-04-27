//
//  Player.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/26/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

class Player{
    public let name: String
    private let movePts: Int
    public var traps: [MovementTrap]
    
    init(){
        self.name = "Timmy"
        self.movePts = 42
        self.traps = []
    }
}
