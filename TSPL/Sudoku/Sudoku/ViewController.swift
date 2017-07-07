//
//  ViewController.swift
//  Sudoku
//
//  Created by 刘尊 on 2017/7/6.
//  Copyright © 2017年 刘尊. All rights reserved.
//

import Cocoa
import SnapKit

class ViewController: NSViewController {
    
    let label = NSTextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 1...10 {
            let label = NSTextField()
            label.stringValue = String(i)
            //label.alignment = NSTextAlignment.center
            label.backgroundColor = NSColor.cyan
            self.view.addSubview(label)
            label.snp.makeConstraints { (make) in
                make.width.equalTo(30)
                make.height.equalTo(30)
                if i == 1 {
                    make.top.equalTo(100)
                    make.left.equalTo(100)
                } else if i / 4 == 0 {
                    make.top.equalTo(100)
                    make.left.equalTo(100+80*(i-1))
                } else if i % 3 == 1  {
                    make.top.equalTo(100+80*(i/3))
                    make.left.equalTo(100)
                } else {
                    make.top.equalTo(100+80*(i-1)/3)
                    make.left.equalTo(100+80*(((i-1)%3)-1))
                }
            }
        }
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

