//
//  ViewController.swift
//  test
//
//  Created by Chong, Hansel on 4/3/15.
//  Copyright (c) 2015 Chong, Hansel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var display: UILabel!
    
    var middleOfTyping = false

    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if(middleOfTyping){
            display.text = display.text! + digit
        }
        else{
            display.text = digit
            middleOfTyping = true
        }
    }
    
    var operandStack = Array<Double>()
    @IBAction func enter() {
        middleOfTyping = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if(middleOfTyping) {
            enter()
        }
        switch operation{
        case "✕": performOperation {$0 * $1}
            case "÷": performOperation {$1 / $0}
            case "-": performOperation {$1 - $0}
            case "+": performOperation {$0 + $1}
            default: break
        }
    }
    
    func performOperation(operation:(Double,Double) -> Double){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
    }
    
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            middleOfTyping = false
        }
    }
}

