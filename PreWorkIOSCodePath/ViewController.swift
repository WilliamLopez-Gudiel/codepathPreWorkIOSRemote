//
//  ViewController.swift
//  PreWorkIOSCodePath
//
//  Created by William Gudiel on 1/3/23.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var introduceLabel: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    
    @IBOutlet weak var morePetsStepper: UIStepper!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    @IBOutlet weak var morePetsLabel: UILabel!
    @IBOutlet weak var theImage: UIImageView!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var petLabel: UILabel!
    
    
    struct DefaultsKeys {
        static let keyOne = "firstNameKey"
        static let keyTwo = "secondNameKey"
        static let keyThree = "schoolNameKey"
        static let keyFour = "yearKey"
        static let keyFive = "numPetsKey"
        static let keySix = "switchKey"
        
        
    }
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let stringOne = defaults.string(forKey: DefaultsKeys.keyOne) {
            firstNameTextField.text = stringOne
        }
        if let stringTwo = defaults.string(forKey: DefaultsKeys.keyTwo) {
            lastNameTextField.text = stringTwo
        }
        if let stringThree = defaults.string(forKey: DefaultsKeys.keyThree) {
            schoolNameTextField.text = stringThree
        }
        let yearInt = defaults.integer(forKey: DefaultsKeys.keyFour)
        yearSegmentedControl.selectedSegmentIndex = yearInt
        let numOfPetsDouble = defaults.double(forKey: DefaultsKeys.keyFive)
        morePetsStepper.value = numOfPetsDouble
        numberOfPetsLabel.text = "\(Int(numOfPetsDouble))"
        let isSwitchOn = defaults.bool(forKey: DefaultsKeys.keySix)
        morePetsSwitch.isOn = isSwitchOn
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {



            UIView.animate(
                withDuration: 1.0,
                delay: 0.0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.5,
                options: .curveLinear,
                animations: {
                    self.theImage.frame.origin.x = 20
            }) { (completed) in

            }
        
        UIView.animate(
            withDuration: 1.0,
            delay: 0.3,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.5,
            options: .curveLinear,
            animations: {
                self.lastNameTextField.frame.origin.x = 87
                self.lastLabel.frame.origin.x = 20
                self.firstNameTextField.frame.origin.x = 87
                self.firstLabel.frame.origin.x = 20
                self.schoolNameTextField.frame.origin.x = 87
                self.schoolLabel.frame.origin.x = 20
        }) { (completed) in

        }
        
        
        UIView.animate(
            withDuration: 1.0,
            delay: 0.6,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.5,
            options: .curveLinear,
            animations: {
                self.yearSegmentedControl.frame.origin.x = 20
        }) { (completed) in

        }
        
        
        UIView.animate(
            withDuration: 1.0,
            delay: 0.9,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.5,
            options: .curveLinear,
            animations: {
                self.petLabel.frame.origin.x = 20
                self.morePetsLabel.frame.origin.x = 20
                self.numberOfPetsLabel.frame.origin.x = 87
                self.morePetsStepper.frame.origin.x = 300
                self.morePetsSwitch.frame.origin.x = 334
                
                
                

        }) { (completed) in

        }
        
        UIView.animate(
            withDuration: 2.0,
            delay: 0.9,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.5,
            options: .curveLinear,
            animations: {
                self.introduceLabel.frame.origin.x = 143
        }) { (completed) in

        }
        }
    

    @IBAction func stepperPressed(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
        
        defaults.set(sender.value, forKey: DefaultsKeys.keyFive)
        
    }
    @IBAction func schoolNameEdited(_ sender: UITextField) {
        defaults.set(sender.text, forKey: DefaultsKeys.keyThree)
    }
    @IBAction func lastNameEdited(_ sender: UITextField) {
        defaults.set(sender.text, forKey: DefaultsKeys.keyTwo)
    }
    
    @IBAction func firstNameEdited(_ sender: UITextField) {
        defaults.set(sender.text, forKey: DefaultsKeys.keyOne)
    }
    
    @IBAction func yearChanged(_ sender: UISegmentedControl) {
        defaults.set(sender.selectedSegmentIndex, forKey: DefaultsKeys.keyFour)
    }
    
    @IBAction func switchChnaged(_ sender: UISwitch) {
        defaults.set(sender.isOn, forKey: DefaultsKeys.keySix)
    }
    
    @IBAction func introduceSelfBtnPressed(_ sender: UIButton) {
        
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."
        
        print(introduction)
        
        
        // Creates the alert where we pass in our message, which our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}

