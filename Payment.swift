//
//  Payment.swift
//  Parking App
//
//  Created by Mohit Mamtani on 2019-11-21.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import Foundation

public class PaymentModel{
    init(cardNumber: String, expiryDate: Date, cvvNumber: String, cardholderName: String, email: String) {
        self.cardNumber = cardNumber
        self.expiryDate = expiryDate
        self.cvvNumber = cvvNumber
        self.cardholderName = cardholderName
    }
    
    var cardNumber: String!
    var expiryDate: Date!
    var cvvNumber: String!
    var cardholderName: String!
    var email: String!
     
    
    
    
}

