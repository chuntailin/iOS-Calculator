//
//  ViewController.swift
//  Calculator
//
//  Created by Chun Tie Lin on 2016/3/15.
//  Copyright © 2016年 ChunTaiLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var temp :Double = 0
    var operateSign = ""
    
    @IBAction func appendNumber(sender: AnyObject) {
        if let number = sender.currentTitle{
            display.text = display.text! + number!
        }
    }
    
    @IBAction func clear(sender: AnyObject) {
        display.text?.removeAll()
    }
    
    @IBAction func changeSign(sender: AnyObject) {
        let searchCharacter = "-"
        
        if ((display.text?.containsString(searchCharacter)) === true){
            display.text?.removeAtIndex((display.text?.startIndex)!)
        }else{
            display.text?.insert("-", atIndex: (display.text?.startIndex)!)
        }
    }
    
    @IBAction func divide100(sender: AnyObject) {
        var result = Double(display.text!)!/100.0
        display.text = String(result)
        
    }
    
    @IBAction func operate(sender: AnyObject) {
        operateSign = sender.currentTitle!!
        temp = Double(display.text!)!
        display.text = ""

    }
    
    @IBAction func equal(sender: AnyObject) {
        var result :Double = 0
        var currentTitle = display.text!

            if operateSign == "+"{
                result = temp + Double(currentTitle)!
                operateSign = ""
            }else if operateSign == "−"{
                result = temp - Double(currentTitle)!
                operateSign = ""
            }else if operateSign == "×"{
                result = temp * Double(currentTitle)!
                operateSign = ""
            }else if operateSign == "÷"{
                result = temp / Double(currentTitle)!
                operateSign = ""
        }
        
        display.text = String(result)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

