//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Edgar on 5/10/16.
//  Copyright © 2016 Edgar Gante. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    // NSNumberFormatter to display no more than one fractional digit.
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return(value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
        
    func updateCelsiusLabel() {
        if let value = celsiusValue {
        celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
                celsiusLabel.text = "???"
            }
        }
    
    // Print the text field’s current text as well as the replacement string.
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            
            return false
        } else {
            return true
        }
    }
}



