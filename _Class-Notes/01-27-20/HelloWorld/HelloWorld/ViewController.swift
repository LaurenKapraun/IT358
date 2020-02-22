//
//  ViewController.swift
//  HelloWorld
//
//  Created by Kapraun, Lauren on 1/27/20.
//  Copyright © 2020 Kapraun, Lauren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Button
    // _ = You don't need to provide a label
    @IBAction func sayHello(_ sender: UIButton) {
        
        // Ref: https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift

        // create the alert

        /*let alert = UIAlertController(title: "IT 358", message: "Welcome to this class!", preferredStyle: UIAlertController.Style.alert)*/
       
        // .text = get text inserted
        // ?? "" = if nil, add an empty string
        let msg = (nameTF.text ?? "") + ", welcome to this class!"

        let alert = UIAlertController(title: "IT 358", message: msg, preferredStyle: UIAlertController.Style.alert)
        

        

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        

        // show the alert
        // self refers to view controller
        self.present(alert, animated: true, completion: nil)
       
    }
    
    //Text box
    @IBOutlet weak var nameTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

