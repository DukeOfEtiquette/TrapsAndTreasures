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
    var i = 0
    var movement = 46
    var traps = 2
    var firstMoveCommpensation = false
    var imageHolder = [UIImage]()
    
    let image1 = UIImage(named: "blockTile.jpg")!
    
    @IBOutlet var tiles: Array<UIImageView>?
    
    @IBOutlet weak var tile_1: UIImageView!
    @IBOutlet weak var tile_2: UIImageView!
    @IBOutlet weak var tile_3: UIImageView!
    @IBOutlet weak var tile_4: UIImageView!
    @IBOutlet weak var player: UIImageView!
    
    
    @IBOutlet weak var movementLabel: UILabel!
    @IBOutlet weak var numberOfTraps: UILabel!
    
    
    @IBAction func moveDown(_ sender: Any) {
        
        if movement > 0{
            //adjust the image forward by one
            i += 1
            //because of initial image configuration have to adjust the first move
            if firstMoveCommpensation  == false{
                i = 0
                firstMoveCommpensation = true
            }
            //if i is pointing past the last image in the array reset back to begining
            if i > 4 {
                i = 0
            }
            //itterate through the tiles assigning the images to the tiles
            for tile in tiles!{
                tile.image = imageHolder[i]
                i += 1
                if i > 4{
                    i = 0
                }
            }
            //reset i back to its initial position + 1
            counter += 1
            if counter >= 5 {
                counter = 0
            }
            i = counter
            movement -= 1
            self.movementLabel.text = "Moves Left: \(movement)"

        }

    }
    
    
    @IBAction func moveUp(_ sender: Any) {
        if movement > 0{
            i -= 1
            
            if firstMoveCommpensation  == false{
                i = 3
                counter = 4
                firstMoveCommpensation = true
            }
            if i < 0{
                i = 4
            }
            for tile in tiles!{
                tile.image = imageHolder[i]
                i += 1
                if i > 4 {
                    i = 0
                }
            }
    
            counter -= 1
            
            if counter < 0 {
                counter = 4
            }
            i = counter
            movement -= 1
            self.movementLabel.text = "Moves Left: \(movement)"
        }

    }
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.movementLabel.text = "Moves Left:\(movement)"
        self.numberOfTraps.text = "traps: \(traps)"
        imageHolder.append(UIImage(named: "blockTile.jpg")!)
        imageHolder.append(UIImage(named: "blockTile2.jpg")!)
        imageHolder.append(UIImage(named: "blockTile3.jpg")!)
        imageHolder.append(UIImage(named: "blockTile4.jpg")!)
        imageHolder.append(UIImage(named: "blockTile5.jpg")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
