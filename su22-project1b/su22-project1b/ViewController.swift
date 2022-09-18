//
//  ViewController.swift
//  su22-project1b
//
//  Created by George Martin on 6/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    //Make dependancies to Main
    @IBOutlet weak var LoanLabel: UILabel!
    @IBOutlet weak var LoanField: UITextField!
    
    @IBOutlet weak var numPaymentLabel: UILabel!
    @IBOutlet weak var numPaymentField: UITextField!
    
    @IBOutlet weak var InterestLabel1: UILabel!
    @IBOutlet weak var InterestLabel2: UILabel!
    @IBOutlet weak var InterestField: UITextField!
    
    @IBOutlet weak var CalculatePaymentBtn: UIButton!
    
    @IBOutlet weak var FixedPaymentLabel: UILabel!
    @IBOutlet weak var FixedPaymentField: UITextField!
    
    @IBOutlet weak var LifeLoanLabel: UILabel!
    @IBOutlet weak var LifeLoanField: UITextField!
    
    
    //Load View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set type of keyboard allowed for user input
        LoanField.keyboardType = UIKeyboardType.decimalPad //Allows for Float Type
        numPaymentField.keyboardType = UIKeyboardType.numberPad //Allows for Int Type
        InterestField.keyboardType = UIKeyboardType.decimalPad //Allows for Float Type
    }
    
    //Function that hides keyboard once finished
    @IBAction func onTapRecognized(_ sender: Any) {
        LoanField.resignFirstResponder()
        numPaymentField.resignFirstResponder()
        InterestField.resignFirstResponder()
    }
    

    @IBAction func CalculatePayment(_ sender: UIButton) {
        
        // Catch 'nil' textField values and alert user
        if (LoanField.text == "" || numPaymentField.text == "" || InterestField.text == "") {
            
            //Alert Title and Text
            let controller = UIAlertController(title: "ERROR", message: "A REQUIRED FIELD IS EMPTY.", preferredStyle: .actionSheet)
            
            //Button Choice(s)
            let alertAction = UIAlertAction(title: "OKAY", style: .destructive, handler: nil)
      
            //Add action(s)
            controller.addAction(alertAction)
            
            //Something required for alert
            if let ppc = controller.popoverPresentationController {
                ppc.sourceView = sender
                ppc.sourceRect = sender.bounds
            }
            
            //Present the controller
            present(controller,animated: true, completion: nil)
        }
        
        
        // If text fields have values entered, procedeed
        else {
            // Takes text from Fields and converts to Int/Float
            let totalLoan: Float = Float(LoanField.text!)!
            let numPayments: Int = Int(numPaymentField.text!)!
            // Interest rate in decimal form where 1.0 would be a 100% interest rate
            let interestRate: Float = Float(InterestField.text!)!/100
            
                // Catch entered values are invalid and alert
                if (totalLoan <= 0 || numPayments <= 0 || interestRate <= 0.00) {
                    
                    //Alert Title and Text
                    let controller = UIAlertController(title: "ERROR", message: "A REQUIRED FIELD HAS AN INVALID ENTRY.", preferredStyle: .actionSheet)
                        
                    //Button Choice(s)
                    let alertAction2 = UIAlertAction(title: "OKAY", style: .destructive, handler: nil)
                  
                    //Add action(s)
                    controller.addAction(alertAction2)
                        
                    //Something required for alert
                    if let ppc = controller.popoverPresentationController {
                        ppc.sourceView = sender
                        ppc.sourceRect = sender.bounds
                    }
                        
                    //Present the controller
                    present(controller,animated: true, completion: nil)
                }
            
            
            // Values are valid. Continue.
            else {
                
                //Since mortgage equation is somewhat complicated, this is broken into a numberator and denominator
    
                //Numerator part of mortgage equation
                let numerator: Float = (totalLoan * (interestRate * pow((1.0 + interestRate), Float(numPayments))))
                
                //Denominator part of mortgage equation
                let denominator: Float = (pow((1.0 + interestRate),Float(numPayments))-1)
                
                //Result of combined mortgage equations
                let result = (numerator/denominator)
                
                //Rounds the results to the nearest penny
                let roundedResult = round(result * 100) / 100.0
                
                //Update field to display fixed monthly/annual payment
                FixedPaymentField.text = String(roundedResult)
                
                //Update field to display total cost of the loan
                LifeLoanField.text = String(result * Float(numPayments))
            }
        }
    }
}
