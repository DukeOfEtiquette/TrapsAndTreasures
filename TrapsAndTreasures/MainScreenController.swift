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
    
    @IBAction func inputName(sender: UITextField){
        let name = sender.text!
        playerName.text = "Hi \(name)!"
        nameInput.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
    
}


