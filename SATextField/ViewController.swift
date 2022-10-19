//
//  ViewController.swift
//  SATextField
//
//  Created by Paresh Kanani on 23/06/22.
//

import UIKit
import IQKeyboardManagerSwift

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstNameTextField: SAFloatingTextField!
    @IBOutlet weak var lastNameTextField: SAFloatingTextField!
    @IBOutlet weak var emailTextField: SAFloatingTextField!
    @IBOutlet weak var dobTextField: SAFloatingTextField!
    @IBOutlet weak var websiteTextField: SAFloatingTextField!
    @IBOutlet weak var street1TextField: SAFloatingTextField!
    @IBOutlet weak var street2TextField: SAFloatingTextField!
    @IBOutlet weak var postalCodeTextField: SAFloatingTextField!
    @IBOutlet weak var cityTextField: SAFloatingTextField!
    @IBOutlet weak var stateTextField: SAFloatingTextField!
    @IBOutlet weak var countryTextField: SAFloatingTextField!
    @IBOutlet weak var submitButton: SAButton!
    @IBOutlet weak var notificationSwitch: SASwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setDesign()
    }
    
    fileprivate func setDesign() {
        self.title = "Form details"
        self.scrollView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.emailTextField.delegate = self
        self.dobTextField.delegate = self
        self.websiteTextField.delegate = self
        self.street1TextField.delegate = self
        self.street2TextField.delegate = self
        self.postalCodeTextField.delegate = self
        self.cityTextField.delegate = self
        self.stateTextField.delegate = self
        self.countryTextField.delegate = self
        
        self.notificationSwitch.delegate = self
        self.notificationSwitch.isOn    = false
        self.notificationSwitch.myColor = #colorLiteral(red: 0.4156862745, green: 0.4156862745, blue: 0.4156862745, alpha: 1)
        
        self.emailTextField.keyboardToolbar.nextBarButton.setTarget(self, action: #selector(self.nextAction(_:)))
        self.websiteTextField.keyboardToolbar.previousBarButton.setTarget(self, action: #selector(self.prevAction(_:)))
    }
    
    //MARK:- Button Action
    @IBAction func submitButtonAction(_ sender: Any) {
        
    }
    
    @objc func nextAction(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @objc func prevAction(_ sender: Any) {
        print("Next Action ")
        self.view.endEditing(true)
    }
}

extension ViewController: SASwitchDelegate {
    func valueChanged(sender: SASwitch) {
        if sender.isOn {
            self.notificationSwitch.isOn = true
            self.notificationSwitch.myColor = #colorLiteral(red: 0.968627451, green: 0.7882352941, blue: 0.7960784314, alpha: 1)
        }
        else {
            self.notificationSwitch.isOn    = false
            self.notificationSwitch.myColor = #colorLiteral(red: 0.4156862745, green: 0.4156862745, blue: 0.4156862745, alpha: 1)
        }
    }
}

//MARK:- UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.dobTextField {
            self.view.endEditing(true)
            SAPicker.selectDate(title: "Select date", cancelText: "Cancel", datePickerMode: .date, didSelectDate: { [weak self](selectedDate) in
                self?.dobTextField.text = "\(selectedDate)"
            })
            return false
        }
        else {
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.firstNameTextField {
            self.lastNameTextField.becomeFirstResponder()
        }
        else if textField == self.lastNameTextField {
            self.emailTextField.becomeFirstResponder()
        }
        else if textField == self.emailTextField {
            self.dobTextField.becomeFirstResponder()
        }
        else if textField == self.dobTextField {
            self.websiteTextField.becomeFirstResponder()
        }
        else if textField == self.websiteTextField {
            self.street1TextField.becomeFirstResponder()
        }
        else if textField == self.street1TextField {
            self.street2TextField.becomeFirstResponder()
        }
        else if textField == self.street2TextField {
            self.postalCodeTextField.becomeFirstResponder()
        }
        else if textField == self.postalCodeTextField {
            self.cityTextField.becomeFirstResponder()
        }
        else if textField == self.cityTextField {
            self.stateTextField.becomeFirstResponder()
        }
        else if textField == self.stateTextField {
            self.countryTextField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
}

