//
//  GameWorld.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/26/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

class GameWorld{
    private var playerLocation: Int
    private var gameTiles: [Tile]
    
    init(){
        self.playerLocation = -1
        self.gameTiles = []
    }
    
    init(playerLocation: Int, gameTiles: [Tile]){
        self.playerLocation = playerLocation
        self.gameTiles = gameTiles
    }

    //Get playerLocation
    var playerLocation: Int{
        return self.playerLocation
    }

    //Accept a tile location and set the playerLocation to it
    public func setPlayerTile(tile: Int){
        self.playerLocation = tile
    }
    
    public func movePlayer(){
        //TODO(Adam): Define this function
    }
    
    //Compare the player's current location against a tile location passed to func
    public func isPlayer(onThisTile testTile: Int) -> Bool{
        if(testTile == self.playerLocation){
            return true
        }else{
            return false
        }
    }
}
