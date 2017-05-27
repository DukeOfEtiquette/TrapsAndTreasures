//
//  GameplayBController.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/20/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

import UIKit
import SpriteKit

import PusherSwift

let options = PusherClientOptions(
    host: .cluster("us2")
)

let pusher = Pusher(
    key: "338b7804d638b00a56a2",
    options: options
)


class GameplayController: UIViewController {
     //temp placeholders
    var playerLocation = 0
    var otherPlayer = 1
    var secondPlayer = 2
    var otherPlayerName = "Jeff"
    var secondPlayerName = "Bill"
    
    var i = 0
    public var movement = 0
    var traps = 2
    var firstMoveCommpensation = false
    var imageHolder = [UIImage]()
    var otherPlayerPositions: [String: Int] = [:]
    let playerMovedUp = 0
    let playerMovedDown = 1

    
    let image1 = UIImage(named: "blockTile.jpg")!
    
    @IBOutlet var tiles: Array<UIImageView>?
    @IBOutlet var otherPlayers: Array<UIImageView>?
        
    @IBOutlet weak var tile_1: UIImageView!
    @IBOutlet weak var tile_2: UIImageView!
    @IBOutlet weak var tile_3: UIImageView!
    @IBOutlet weak var tile_4: UIImageView!
    @IBOutlet weak var player: UIImageView!
    //player location is tile 3
    
    @IBOutlet weak var movementLabel: UILabel!
    @IBOutlet weak var numberOfTraps: UILabel!
    
    @IBAction func increaseMovement(_ sender: Any) {
        movement += 10
        self.movementLabel.text = "Moves Left: \(movement)"
        saveMovementPoints()
    }
    
    @IBAction func moveDown(_ sender: Any) {
        draw(playerMovement: playerMovedDown)
       
        
        //Update how many movement points are left
        saveMovementPoints()

    }
    
    
    @IBAction func moveUp(_ sender: Any) {
        draw(playerMovement: playerMovedUp)
    }
    
    func saveMovementPoints() {
        let defaults = UserDefaults.standard
        defaults.set(movement, forKey: "movePts")
        defaults.synchronize()
    }
  
    func setRandomTreasure(){
        
        //5% chance to set a treasure on the map randomly
        let roll = Int(arc4random_uniform(UInt32(100)))
        if(roll < 5)
        {
            alertMessage(title: "Treasure!", message: "A new treasure has randomly been placed on the map!")
        }
    }
    
    //Generic alert message function so we don't have to reqrite the same three lines of code
    //every time we want to make an alert
    func noMovementPointsAlert(){
        alertMessage(title: "No Movement", message: "You have no more movement points left! Get up and go for a walk to gain more!")
    }
    
    func alertMessage(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func draw(playerMovement:Int){
        let tileCount = (tiles?.count)! - 1
        
        if movement > 0{
            if playerMovement == playerMovedDown{
                movedDown(tileCount: tileCount)
            }
            else if playerMovement == playerMovedUp{
                movedUp(tileCount: tileCount)
            } else{
                
            }
            adjustOtherPlayersPosition(tileCount: tileCount)

            movement -= 1
            self.movementLabel.text = "Moves Left: \(movement)"
            
            //Try to set a random treasure
            //  setRandomTreasure()
            //Update how many movement points are left
            saveMovementPoints()
            
        } else{
            noMovementPointsAlert()
        }
        
    }
    
    func movedDown(tileCount: Int){
        //adjust the image forward by one
        i += 1
        //because of initial image configuration have to adjust the first move
        if firstMoveCommpensation  == false{
            i = 0
            firstMoveCommpensation = true
        }
        //if i is pointing past the last image in the array reset back to begining
        if i > (tiles?.count)! - 1{
            i = 0
        }
        //itterate through the tiles assigning the images to the tiles
        for tile in tiles!{
            tile.image = imageHolder[i]
            i += 1
            if i > tileCount{
                i = 0
            }
        }
        playerLocation += 1
        if playerLocation > tileCount  {
            playerLocation = 0
        }
        i = playerLocation

    }
    func movedUp(tileCount:Int){
        i -= 1
        
        if firstMoveCommpensation  == false{
            i = tileCount - 1
            playerLocation = tileCount
            firstMoveCommpensation = true
        }
        if i < 0{
            i = tileCount
        }
        for tile in tiles!{
            tile.image = imageHolder[i]
            i += 1
            if i > tileCount{
                i = 0
            }
        }
        
        playerLocation -= 1
        
        if playerLocation < 0 {
            playerLocation = tileCount
        }
        i = playerLocation
        movement -= 1
    }
    func adjustOtherPlayersPosition(tileCount: Int){
        for player in otherPlayers!{
            player.image = nil
            
        }

        for player in otherPlayerPositions{
            var enemyPosition = player.value - playerLocation + 2
                if enemyPosition < 0 {
                    enemyPosition = tileCount
                }
        
    
            print(enemyPosition)
            // print(otherPlayer)
            //print(playerLocation)
            
            if 0 <= enemyPosition && enemyPosition < tileCount + 1{
                otherPlayers?[enemyPosition].image = UIImage(named: "Werewitch.png")
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.movementLabel.text = "Moves Left: \(movement)"
        self.numberOfTraps.text = "traps: \(traps)"
        imageHolder.append(UIImage(named: "blockTile.jpg")!)
        imageHolder.append(UIImage(named: "blockTile2.jpg")!)
        imageHolder.append(UIImage(named: "blockTile3.jpg")!)
        imageHolder.append(UIImage(named: "blockTile4.jpg")!)
        imageHolder.append(UIImage(named: "blockTile5.jpg")!)
        otherPlayerPositions[otherPlayerName] = otherPlayer
        otherPlayerPositions[secondPlayerName] = secondPlayer
        
        // subscribe to channel and bind to event
        let channel = pusher.subscribe("my-channel")
        
        let _ = channel.bind(eventName: "Trap_11", callback: { (data: Any?) -> Void in
            if let data = data as? [String : AnyObject] {
                if let message = data["message"] as? String {
                    print(message)
                }
            }
        })
        
        /*
        let _ = channel.bind(eventName: "player-move", callback: { (data: Any?) -> Void in
            if let data = data as? [String : AnyObject] {
                if let new_location = data["new_location"] as? String, let player_id = data["player_id"] as? String {
                    self.loc_labal.text = new_location
                    
                    let lowLocation = self.playerLocation - self.fogOfWar
                    let highLocation = self.playerLocation + self.fogOfWar
                    let newLocation = Int(new_location)!
                    
                    
                    if(newLocation >= lowLocation && newLocation <= highLocation)
                    {
                        self.my_label.text = player_id
                    }
                }
            }
        })*/
        
        pusher.connect()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
