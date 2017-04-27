//
//  GameWorld.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/26/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

class GameWorld{
    private var playerLocation: Tile
    private var gameTiles: [Tile]
    
    init(){
        self.playerLocation = Tile()
        self.gameTiles = []
    }
    
    init(playerLocation: Tile, gameTiles: [Tile]){
        self.playerLocation = playerLocation
        self.gameTiles = gameTiles
    }
}
