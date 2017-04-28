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
    public var traps: MovementTrap
    
    init(name: String, movePts: Int){
        self.name = name
        self.movePts = movePts
        self.traps = MovementTrap()
    }

    //Get number of movement points a player has
    var numberOfMovePts: Int {
        return self.movePts
    }

    //Get number of traps a player has
    var numberOfMovementTraps: Int {
        return self.traps.numberOfTraps
    }
    
    //Add movementpoints to player equal to value passed
    //Since the parameter is unsigned this can be used to decrease as well
    public func addMovePts(pointsToAdd: Int){
        self.movePts += pointsToAdd
    }
    
    //A number of traps passed to function
    public func addTraps(numberToAdd: Int){
        self.traps.increaseTrapQuantity(numToInc: numberToAdd)
    }
}
