//
//  User.swift
//  Parking App
//
//  Created by Mohit Mamtani on 2019-11-21.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import Foundation

public class User{
    init(name: String, email: String, password: String, phoneNumber: String, plateNumber: String, cardNumber: String, expiryDate: Date, cvvNumber: String, cardholderName: String) {
        self.name = name
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
        self.plateNumber = plateNumber
        self.cardNumber = cardNumber
        self.expiryDate = expiryDate
        self.cvvNumber = cvvNumber
        self.cardholderName = cardholderName
    }
    
    
    var name: String!
    var email: String!
    var password: String!
    var phoneNumber: String!
    var plateNumber: String!
    var cardNumber: String!
    var expiryDate: Date!
    var cvvNumber: String!
    var cardholderName: String!
    
    
    
    
    
    
    
}
