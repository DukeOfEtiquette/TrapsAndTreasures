//
//  MovementTrap.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/26/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

import Foundation

class MovementTrap{
    let name = "Minor Movement Trap"
    let penalty = -1

    //Increase of having a player carry around a MovementTrap object
    //for every trap they own, they carry just one with a quantity to track
    //the number of traps they own.
    var quantity: Int

    init(){
        self.quantity = 0
    }

    //Get the value of the movement penalty associated with this trap
    var movePenalty: Int{
        return self.penalty
    }

    //Get number of traps available
    var numberOfTraps: Int {
        return self.quantity
    }

    //If no int is passed then just increase by 1
    public func increaseTrapQuantity(){
        self.quantity += 1
    }

    //Increase number of traps by value passed
    public func increaseTrapQuantity(numToInc: Int){
        self.quantity += numToInc
    }

    //Remove one trap from inventory
    public func decreaseTrapQuantity(){
        self.quantity -= 1
    }
    
    //Might use this approach later, right now keeping simple
    /*
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
    
    //TODO(Adam): Look into the supercede or whatever initializers
    init(penalty: Int){
        self.penalty = penalty
        
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
    }*/
}
