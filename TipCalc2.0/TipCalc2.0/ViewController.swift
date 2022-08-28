//
//  ViewController.swift
//  TipCalc2.0
//
//  Created by Ryan Elizondo-Fallas on 10/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    let tipPercentData: [Double] = [0.10, 0.15, 0.20, 0.25]
    var tipPercent: Double = 0.10
    
    //IB Vars
    
    @IBOutlet weak var billTotalLabel: UILabel!
    
    @IBOutlet weak var tipTotalLabel: UILabel!
    
    @IBOutlet weak var tipSegementedControl: UISegmentedControl!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    //IB Actions
    @IBAction func didTapCalcButton(_ sender: Any) {
        
        if amountTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            print("invalid entry for amount text field.")
            return
        }
        
        let billString = amountTextField.text!
        
        
        //guard statement basically says ' if(billAmount == nil) {return} '
        //so it will let billAmount  = Double(billString) if a double is casted else aka if it is nil then just return and dont contain to the rest of the program
        guard let billAmount = Double(billString) else {return}
        
        let tipAmount = billAmount * tipPercent
        
        let totalAmount = billAmount + tipAmount
        
        if billString.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return
        }
        
        //puts int into string
        tipTotalLabel.text = String(format: "$%.2f", tipAmount)
        billTotalLabel.text = String(format: "$%.2f", totalAmount)
        
        view.endEditing(true)
        
    }
    
    //segmented control aka tip bar
    @IBAction func didTapSegmentedControl(_ sender: Any) {
        tipPercent = tipPercentData[tipSegementedControl.selectedSegmentIndex]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipTotalLabel.text = "$0.00"
        billTotalLabel.text = "$0.00"
    }


}

