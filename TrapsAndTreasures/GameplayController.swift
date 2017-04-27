//
//  GameplayBController.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/20/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

import UIKit
import SpriteKit



class GameplayController: UIViewController {
    var counter = 0
    var movement = 46
    var traps = 2
    
    @IBOutlet var tiles: Array<UIImageView>?
    
    @IBOutlet weak var tile_1: UIImageView!
    @IBOutlet weak var tile_2: UIImageView!
    @IBOutlet weak var tile_3: UIImageView!
    @IBOutlet weak var tile_4: UIImageView!
    
    
    @IBOutlet weak var movementLabel: UILabel!
    @IBOutlet weak var numberOfTraps: UILabel!
    

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        if movement > 0{
            player.center = (tiles?[counter].center)!
            counter += 1
            if counter >= 4 {
                counter = 0
            }
            movement -= 1
            self.movementLabel.text = "Moves Left: \(movement)"
        
        }
        
    }
    @IBOutlet weak var player: UIImageView!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.movementLabel.text = "Moves Left:\(movement)"
        self.numberOfTraps.text = "traps: \(traps)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
