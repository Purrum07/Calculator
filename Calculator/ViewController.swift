//
//  ViewController.swift
//  Calculator
//
//  Created by user192467 on 2/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber:Double = 0;
    var total:Double = 0;
    var calculating:Bool = false;
    var operation:Character = " ";
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func processNumber(_ sender: UIButton) {
        
        if calculating == true{
            if let numberText = sender.titleLabel?.text {
                if (displayLabel.text == "0") {
                    displayLabel.text = numberText
                } else {
                    displayLabel.text = displayLabel.text! + numberText
                }
            }
            currentNumber = Double(displayLabel.text!)!
            calculating = false
        }
        else{
            if let numberText = sender.titleLabel?.text {
                if (displayLabel.text == "0") {
                    displayLabel.text = numberText
                } else {
                    displayLabel.text = displayLabel.text! + numberText
                    currentNumber = Double(displayLabel.text!)!
                }
            }
        }
    }
    
    @IBAction func processOperation(_ sender: UIButton) {
        if let operationSign = sender.titleLabel?.text{
            if displayLabel.text != "" && operationSign != "C" && operationSign != "="{
                calculate()
                total = Double(displayLabel.text!)!
                
                switch operationSign {
                case "/":
                    calculate()
                    displayLabel.text = "0"
                    operation = Character(operationSign)
                case "*":
                    calculate()
                    displayLabel.text = "0"
                    operation = Character(operationSign)
                case "-":
                    calculate()
                    displayLabel.text = "0"
                    operation = Character(operationSign)
                case "+":
                    calculate()
                    displayLabel.text = "0"
                    operation = Character(operationSign)
                default:
                    break
                }
                calculating = true;
            }
            else if operationSign == "="
            {
                calculate()
            }
            else if operationSign == "C"{
                displayLabel.text = "";
                total = 0;
                currentNumber = 0;
                operation = " "
            }
        }
    }
    
    private func calculate(){
        
        switch operation {
        case "/":
            total = total / currentNumber
            displayLabel.text = String(total)
            operation = " "
        case "*":
            total = total * currentNumber
            displayLabel.text = String(total)
            operation = " "
        case "-":
            total = total - currentNumber
            displayLabel.text = String(total)
            operation = " "
        case "+":
            total = total + currentNumber
            displayLabel.text = String(total)
            operation = " "
        default:
            break
        }
    }
}
