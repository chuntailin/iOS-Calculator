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
    
    var tempArray = [String]()
    var temp :Double = 0
    var operatorArray = [String]()
    var operateSign = ""
    
    @IBAction func appendNumber(sender: AnyObject) {
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.blackColor().CGColor
        if let number = sender.currentTitle{
            display.text = display.text! + number!
        }
    }
    
    @IBAction func clear(sender: AnyObject) {
        display.text?.removeAll()
        tempArray = []
        operatorArray = []
        temp = 0
    }
    
    @IBAction func changeSign(sender: AnyObject) {
        let searchCharacter = "-"
        
        if ((display.text?.containsString(searchCharacter)) == true){
            display.text?.removeAtIndex((display.text?.startIndex)!)
        }else{
            display.text?.insert("-", atIndex: (display.text?.startIndex)!)
        }
    }
    
    @IBAction func divide100(sender: AnyObject) {
        let result = Double(display.text!)!/100.0
        display.text = String(result)
        
    }
    
    @IBAction func operate(sender: AnyObject) {
        operateSign = sender.currentTitle!!
        tempArray.append(display.text!)
        operatorArray.append(operateSign)
        display.text = ""
        
    }
    
    @IBAction func equal(sender: AnyObject) {
        let currentTitle = display.text!
        tempArray.append(currentTitle)
        
        if tempArray.count > 0 {
            temp = Double(tempArray.first!)!
            tempArray.removeAtIndex(tempArray.startIndex)
            
            for(var i=0 ; i<tempArray.count; i++){
                if operatorArray[i] == "+"{
                    temp = temp + Double(tempArray[i])!
                }else if operatorArray[i] == "−"{
                    temp = temp - Double(tempArray[i])!
                }else if operatorArray[i] == "×"{
                    temp = temp * Double(tempArray[i])!
                }else if operatorArray[i] == "÷"{
                    temp = temp / Double(tempArray[i])!
                }
            }
        }
        display.text = String(temp)
        tempArray = []
        operatorArray = []
        temp = 0

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

