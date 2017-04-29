//
//  Tile.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/26/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

class Tile{
    private var treasure: Treasure?
    private var moveTrap: MovementTrap?
    
    
    init(){
        self.treasure = nil
        self.moveTrap = nil
    }
    
    //TODO(Adam): Pretty sure we can make a hierarchy of inits to allow
    //            any combination of traps/treasures to init
    init(treasure: Treasure, moveTrap: MovementTrap){
        self.treasure = treasure
        self.moveTrap = moveTrap
    }

    //Add a trap onto the tile
    public func addTrapToTile(){
        self.moveTrap = MovementTrap()
    }

    //Add a treasure onto the tile
    public func addTreasureToTile(){
        self.treasure = Treasure()
    }
    
    //Determine if this tile has a treasure on it
    public func hasTreasure() -> Bool{
        if let res = self.treasure{
            return true
        }else{
            return false
        }
    }
    
    //Deter if this tile has a trap on it
    public func hasTrap() -> Bool{
        if let res = self.moveTrap{
            return true
        }else{
            return false
        }
    }
    
    //Return movement penalty of the trap
    public func triggerTrap() -> Int{
        //Make sure there is actually a trap
        if hasTrap(){
            //Get movement penalty associated with the trap
            let movePenalty = self.moveTrap!.movePenalty
            //Remove the trap from the tile
            self.moveTrap = nil
            //Return the penalty to caller
            return movePenalty
        }else{
            return 0 //Safety against undesired trigger with no trap
        }
    }
    
    //Return the number of traps in the treasure on this tile
    public func giveTreasure() -> Int{
        //Make sure there is actually a treasure
        if hasTreasure(){
            //Get number of traps in treasure
            let numTraps = self.treasure!.numberOfTraps
            //Remove treasure from tile
            self.treasure = nil
            //Return the number of traps to caller
            return numTraps
        }else{
            return 0 //Safety against undesired trigger with no treasure
        }
    }
}
