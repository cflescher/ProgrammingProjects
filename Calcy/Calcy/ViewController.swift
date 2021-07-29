// ViewController.swift 
// Calcy
// Created on 7/1/21 by Conrad Flescher.
// Copyright 2021 Conrad Flescher. All rights reserved.

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var mainTextView: UILabel!
    
    //MARK: number buttons
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var sevenButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!
    
    
    
    //MARK: action buttons
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var enterButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var divideButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: common functions
    
    ///generic alert presenter function
    func presentAlert(_ alertTitle: String, message alertMessage: String?) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    //MARK: button actions
    
    
    
    //connects to "enter" button
    @IBAction func enterButtonTapped() {
        presentAlert("Not Implemented", message: nil)
    }
    
    //connects to all number buttons
    @IBAction func updateTextView(_ sender: UIButton) {
        let buttonTitle = sender.titleLabel?.text!
        
        if buttonTitle == "clear" {
            mainTextView.text = "0"
        } else {
            mainTextView.text = "\(mainTextView.text ?? "")\(buttonTitle ?? "0")"
            
        }
    }
        
}

