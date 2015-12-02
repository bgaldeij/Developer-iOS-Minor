//
//  ViewController.swift
//  Calculator
//
//  Created by Student on 25/11/15.
//  Copyright © 2015 HHS. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var history: UILabel!
    
    var userIsTypingANumber = false
    var currentNumberHasADot = false
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton)
    {
        let digit = sender.currentTitle!
        
        if userIsTypingANumber
        {
            display.text = display.text! + digit
        }
        else
        {
            userIsTypingANumber = true
            display.text = digit
        }
        
    }
    
    @IBAction func clear(sender: UIButton)
    {
        history.text = ""
        displayValue = 0
        brain.clear()
    }
    
    func addToHistory (addition: String)
    {
        if history.text! == "History"
        {
            history.text = ""
        }
       
        history.text = history.text! + addition + " "
    }
    
    @IBAction func appendDot(sender: UIButton)
    {
        if !currentNumberHasADot
        {
            if userIsTypingANumber
            {
                display.text = display.text! + "."
            }
            else
            {
                userIsTypingANumber = true
                display.text = "0."
            }
        }
        currentNumberHasADot = true
    }
    
    @IBAction func appendConstant(sender: UIButton)
    {
        let constant = sender.currentTitle!
        
        var numberString = ""
        switch constant
        {
        case "π":
            numberString = M_PI.description
            currentNumberHasADot = true
            
        default:
            break
        }
        
        if userIsTypingANumber
        {
            enter()
        }
        
        display.text = numberString
        enter()
        
    }
    
    @IBAction func operate(sender: UIButton)
    {
        if userIsTypingANumber
        {
            enter()
        }
        
        if let operation = sender.currentTitle
        {
            addToHistory(operation)
            if let result = brain.performOperation(operation)
            {
                displayValue = result
            }
            else
            {
                displayValue = 0
            }
        }
    }
    
    @IBAction func enter()
    {
        userIsTypingANumber = false
        currentNumberHasADot = false
        addToHistory("\(displayValue)")
        
        if let result = brain.pushOperand(displayValue)
        {
            displayValue = result
        }
        else
        {
            displayValue = 0
        }
    }
    
    var displayValue : Double
    {
        get
        {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set
        {
            display.text = "\(newValue)"
            userIsTypingANumber = false
        }
    }

}

