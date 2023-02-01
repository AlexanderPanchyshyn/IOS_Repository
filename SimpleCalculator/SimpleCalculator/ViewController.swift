//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by user222882 on 11/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calcWorkings: UILabel?
    @IBOutlet weak var calcResults: UILabel?
    
    
    var workings:String = ""
    var isDot:Bool = false
    
    @IBAction func tapAllClear(_ sender: Any) {
        clearAll()
    }
    
    func calculatePow(work: String) -> String {
        let workArray = work.split(separator: "^")
        let calc = pow(Double(workArray[0])!, Double(workArray[1])!)
        let result = String(calc)
        return result
    }
    
    func calculateLog(work: String) -> String {
        let workArray = work.split(separator: "log ")
        let calc = log(Double(workArray[0])!)/log(10)
        let result = String(calc)
        return result
    }
    
    func calculateAll() -> Void {
        if (validInput()) {
            var checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01*")
            
            if (checkedWorkingsForPercent.contains("^")) {
                checkedWorkingsForPercent = calculatePow(work: checkedWorkingsForPercent)
            }
            if (checkedWorkingsForPercent.contains("log ")) {
                checkedWorkingsForPercent = calculateLog(work: checkedWorkingsForPercent)
            }
            
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calcResults?.text = resultString
            workings = resultString
            calcWorkings?.text = ""
        } else {
            let alert = UIAlertController(
                title: "Invalid",
                message: "Calculator unable to do math based on input!",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func tapCalculate(_ sender: Any) {
        calculateAll()
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings {
            if (specialCharacter(char: char)) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if (index == 0) {
                return false
            }
            if (index == workings.count - 1) {
                return false
            }
            if (previous != -1) {
                if (index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool {
        if (char == "*") {
            return true
        }
        if (char == "/") {
            return true
        }
        if (char == "+") {
            return true
        }
        if (char == "%") {
            return true
        }
        
        return false
    }
    
    func formatResult(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    func clearAll() {
        workings = ""
        calcWorkings?.text = ""
        calcResults?.text = ""
        isDot = false
    }
    
    @IBAction func tapDelete(_ sender: Any) {
        if(!workings.isEmpty) {
            workings.removeLast()
            calcWorkings?.text = workings
        }
    }
    
    func addToWorkings(value: String) {
        workings = workings + value
        calcWorkings?.text = workings
    }
    
    @IBAction func tapLog(_ sender: Any) {
        addToWorkings(value: "log ")
        isDot = false
    }
    
    @IBAction func tapPow(_ sender: Any) {
        addToWorkings(value: "^")
        isDot = false
    }
    
    @IBAction func tapPercent(_ sender: Any) {
        addToWorkings(value: "%")
        isDot = false
    }
    
    @IBAction func tapDivide(_ sender: Any) {
        addToWorkings(value: "/")
        isDot = false
    }
    
    @IBAction func tapMultiply(_ sender: Any) {
        addToWorkings(value: "*")
        isDot = false
    }
    
    @IBAction func tapMinus(_ sender: Any) {
        addToWorkings(value: "-")
        isDot = false
    }
    
    @IBAction func tapPlus(_ sender: Any) {
        addToWorkings(value: "+")
        isDot = false
    }
    
    @IBAction func tapDot(_ sender: Any) {
        if (isDot == false) {
            addToWorkings(value: ".")
            isDot = true
        }
    }
    
    @IBAction func tapZero(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func tapOne(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func tapTwo(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func tapThree(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func tapFour(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func tapFive(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func tapSix(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func tapSeven(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func tapEight(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func tapNine(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
}

