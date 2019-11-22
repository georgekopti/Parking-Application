//
//  User.swift
//  Parking App
//
//  Created by Zakim Javer on 2019-11-22.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import Foundation
class User {
    var name: String
    var email: String
    var password: String
    var id: Int = 0
    var contactNo: String
    var carPlateNo: String
    
    
    
    init(name: String, email: String, password: String, contactNo: String, carPlateNo: String) {
        self.name = name
        self.email = email
        self.password = password
        self.contactNo = contactNo
        self.carPlateNo = carPlateNo
    }
    
    init(email: String, password: String) {
        self.name = ""
        self.email = email
        self.password = password
        self.contactNo = ""
        self.carPlateNo = ""
    }
}
