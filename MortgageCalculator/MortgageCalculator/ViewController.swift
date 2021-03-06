//
//  ViewController.swift
//  MortgageCalculator
//
//  Created by Zhiqiang Liu on 2/26/15.
//  Copyright (c) 2015 Zhiqiang Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loanAmount.text = "168750"
        loanTerm.text = "30"
        loanRate.text = "4.125"
    }
    @IBOutlet weak var loanAmount: UITextField!

    @IBOutlet weak var loanTerm: UITextField!

    @IBOutlet weak var loanRate: UILabel!
    
    @IBOutlet weak var monthlyPayment: UILabel!
    
    @IBOutlet weak var rateSlider: UISlider!
    //get test data
    
    
    @IBAction func calculateMontylyPayment(sender: AnyObject) {
        let loan = (loanAmount.text as NSString).doubleValue
        let term = (loanTerm.text).toInt()! * 12
        let rate = (loanRate.text! as NSString).doubleValue
        
        MortgageCalculationClass.getPaymentSchedule(loan, termMonth: term, interestRate: rate)
        
        let payment = MortgageCalculationClass.getMonthlyPayment(loan, termMonth: term, interestRate: rate)
        monthlyPayment.text = NSString(format: "%.2f", payment)
    }
    
    @IBAction func rateSliderChange(sender: UISlider) {
        let value = Double(Int(rateSlider.value * 1000) / 125) * 0.125
        loanRate.text = NSString(format: "%.3f", value)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //loanAmount.resignFirstResponder()
        //loanTerm.resignFirstResponder()
        //loanRate.resignFirstResponder()
        self.view.endEditing(true)
    }
}

