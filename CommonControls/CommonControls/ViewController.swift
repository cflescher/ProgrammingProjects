// ViewController.swift 
// CommonControls
// Created on 6/22/21 by Conrad Flescher.
// Copyright 2021 Conrad Flescher. All rights reserved.

import UIKit

class ViewController: UIViewController {

    //MARK: outlets
    @IBOutlet var mainSwitch: UISwitch!
    @IBOutlet var mainSlider: UISlider!
    @IBOutlet var mainViewController: UIView!
    @IBOutlet var mainButton: UIButton!
    
    var appTint: UIColor = .systemBlue
    var switchTint: UIColor = .systemGreen
    
    let colorChoices: [UIColor] = [
        .systemBlue, .systemBrown, .systemGreen, .systemIndigo,
        .systemOrange, .systemPink, .systemPurple, .systemRed,
        .systemTeal, .systemYellow]
    
    func setAppTint(_ value: Bool) {
        let randomColorChoiceIndex = Int.random(in: 0..<colorChoices.count)
        switch value {
            case true:
                mainViewController.tintColor = colorChoices[randomColorChoiceIndex]
                mainSwitch.onTintColor = colorChoices[randomColorChoiceIndex]
                //idk why the switch tint is a different value
            case false:
                mainViewController.tintColor = .systemBlue
                mainSwitch.onTintColor = .systemGreen
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainButton.addTarget(self, action: #selector(mainButtonTap(_:)), for: .touchUpInside)
    }

    //MARK: actions
    @IBAction func mainButtonTap(_ sender: UIButton) {
        print("button pressed! switch value: \(mainSwitch.isOn)")
    }
    
    @IBAction func mainSwitchToggled(_ sender: UISwitch) {
        setAppTint(sender.isOn)
        print("switch value changed, is now: \(mainSwitch.isOn)")
    }
    
    @IBAction func mainSliderPositionChanged(_ sender: UISlider) {
        print("slider is at \(sender.value)")
    }
    
    @IBAction func mainTextFieldReturnKeyPressed(_ sender: UITextField) {
        print("main Text Field Return Key Pressed")
    }
    
    @IBAction func mainTextFieldContentChanged(_ sender: UITextField) {
        print("the text field now says \"\(sender.text ?? "nothing")\"")
    }
    
    @IBAction func viewControllerTap(_ sender: UITapGestureRecognizer) {
        print("user tapped view controller at \(sender.location(in: view))")
    }
    
    
    
    
    
}

