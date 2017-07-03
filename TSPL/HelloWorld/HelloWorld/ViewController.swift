//
//  ViewController.swift
//  HelloWorld
//
//  Created by 刘尊 on 2017/7/1.
//  Copyright © 2017年 刘尊. All rights reserved.
//

//Reference from https://www.raywenderlich.com/151741/macos-development-beginners-part-1

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet weak var helloLabel: NSTextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func sayButtonClicked(_ sender: Any) {
        var name = nameField.stringValue
        if name.isEmpty {
            name = "World"
        }
        let greeting = "Hello \(name)!"
        helloLabel.stringValue = greeting
    }

}

