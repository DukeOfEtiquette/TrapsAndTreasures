//
//  Player.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/26/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

class Player{
    public let name: String
    private var movePts: Int
    public var traps: [MovementTrap]
    
    init(name: String, movePts: Int, traps: [MovementTrap]){
        self.name = name
        self.movePts = movePts
        self.traps = traps
    }
    
    //TODO(Adam): Might be better off as a computed value
    public func getMovePts() -> Int{
        return self.movePts
    }
    
    public func addMovePts(pointsToAdd: Int){
        self.movePts += pointsToAdd
    }
    
    
    //TODO(Adam): Might be better off as a computed value
    public func getTrapCount() -> Int{
        return self.traps.count
    }
    
    public func addTraps(trapsToAdd: [MovementTrap]){
        self.traps += trapsToAdd
    }
}
