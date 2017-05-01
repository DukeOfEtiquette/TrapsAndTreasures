//
//  MainScreenController.swift
//  TrapsAndTreasures
//
//  Created by Adam DuQuette on 4/20/17.
//  Copyright © 2017 Dreamy Team. All rights reserved.
//

import UIKit

class MainScreenController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    
    // Key used to access playerName in the plist
    let playerNameKey = "playerName"
    let movementPointsKey = "movePts"
    
    var playerMovementPoints: Int?
    
    @IBAction func inputName(sender: UITextField){
        let name = sender.text!
        saveName(name: name)
        setName(name: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Load name and movement points from plist if it exists
        loadPlayerName()
        loadMovementPoints()
        
        // Need to understand more about "delegates" to understand what this is doing
        nameInput.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func loadPlayerName() {
        // If playerName exists in the plist
        if let playerName = UserDefaults.standard.object(forKey: playerNameKey) as? String {
            setName(name: playerName)
        }
    }
    
    // Sets the label to show the player name and save the name to the plist
    func setName(name: String) {
        playerName.text = "Hi \(name)!"
        
        // Hide textfield
        nameInput.isHidden = true
    }
    
    // Saves playerName to plist
    func saveName(name: String) {
        let defaults = UserDefaults.standard
        defaults.set(name, forKey: playerNameKey)
        defaults.synchronize()
    }
    
    func loadMovementPoints() {
        if let movementPoints = UserDefaults.standard.object(forKey: movementPointsKey) as? Int{
            playerMovementPoints = movementPoints
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameController = segue.destination as? GameplayController {
            gameController.movement = playerMovementPoints!
        }
    }
    
}


