//
//  DetailsViewController.swift
//  Contacts
//
//  Created by Richard Greene on 8/14/17.
//  Copyright © 2017 Richard Greene. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!//this allows the user to input info in text boxes/fields
    @IBOutlet var phoneNumberField: UITextField!
    var contact: Contact?//must be an optional otherwise you'd have to be sure the contact variable had a value at the time the viewController is created (the init) and inits are rarely called on in a UIViewController because segues do that for us

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        self.phoneNumberField.delegate = self
        
        if let contact = self.contact {
            if let name = contact.name {
             self.nameField.text = name
        }
        if let phoneNumber = contact.phoneNumber {
            self.phoneNumberField.text = phoneNumber
        }
    }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  //this function will decide whether the user is editing the phoneNumberField or the nameField and save it to the apprortiate property
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.nameField {
            self.contact?.name = textField.text
        } else if textField == self.phoneNumberField {
            self.contact?.phoneNumber = textField.text
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
