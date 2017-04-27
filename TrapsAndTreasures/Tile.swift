//
//  Tile.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/26/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

class Tile{
    public var treasure: Treasure?
    public var trap: MovementTrap?
    
    
    init(){
        self.treasure = nil
        self.trap = nil
    }
    
    //TODO(Adam): Pretty sure we can make a hierarchy of inits to allow
    //            any combination of traps/treasures to init
    init(treasure: Treasure, trap: MovementTrap){
        self.treasure = treasure
        self.trap = trap
    }
    
    
    public func triggerTrap() -> Int{
        //TODO(Adam): Define this function
        return 0
    }
    
    public func giveTreasure() -> MovementTrap{
        //TODO(Adam): Define this function
        
        return MovementTrap()
    }
}
