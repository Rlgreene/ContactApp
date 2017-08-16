//
//  Contact.swift
//  Contacts
//
//  Created by Richard Greene on 8/14/17.
//  Copyright © 2017 Richard Greene. All rights reserved.
//

import UIKit

//using objective C's "NSObject" makes it easier for other devs to access this class with Objective-C language
class Contact: NSObject {
  //declaring the information needed for each contact, in this case just name & num
    var name: String? //make them optionals so the user isnt required to know both
    var phoneNumber: String?
    
  //a initializer isnt required because both of the property fields are optional
    init(name: String? = nil, phoneNumber: String? = nil) {
        self.name = name
        self.phoneNumber = phoneNumber
        super.init()
    }

}
