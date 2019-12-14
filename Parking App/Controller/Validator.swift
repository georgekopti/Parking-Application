//
//  Validator.swift
//  Parking App
//
//  Created by Zakim Javer on 2019-11-22.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import Foundation
class Validation {
   public func validateName(name: String) ->Bool {
    //first and last name both between 3 - 10 chars long
      let nameRegex = "^\\w{3,10} \\w{3,10}$"
      let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
      let isValidateName = validateName.evaluate(with: name)
      return isValidateName
   }
   public func validaPhoneNumber(phoneNumber: String) -> Bool {
      let phoneNumberRegex = "^[6-9]\\d{9}$"
      let trimmedString = phoneNumber.trimmingCharacters(in: .whitespaces)
      let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
      let isValidPhone = validatePhone.evaluate(with: trimmedString)
      return isValidPhone
   }
   public func validateEmailId(emailID: String) -> Bool {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
      let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      let isValidateEmail = validateEmail.evaluate(with: trimmedString)
      return isValidateEmail
   }
   public func validatePassword(password: String) -> Bool {
      //Minimum 5 characters at least 1 Alphabet and 1 Number:
      let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{5,}$"
      let trimmedString = password.trimmingCharacters(in: .whitespaces)
      let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
      let isvalidatePass = validatePassord.evaluate(with: trimmedString)
      return isvalidatePass
   }
    
    public func validatePlateNumber(plate: String) -> Bool {
       //needs to be a number or a digit
       let regEx = "\\w{3,9}$"
       let trimmedString = plate.trimmingCharacters(in: .whitespaces)
       let validatePlate = NSPredicate(format:"SELF MATCHES %@", regEx)
       let isvalidate = validatePlate.evaluate(with: trimmedString)
       return isvalidate
    }
    
    public func validateCardNumber(card: String) -> Bool {
       //more then 10 digits
       let regEx = "[0-9]{10,}"
       let trimmedString = card.trimmingCharacters(in: .whitespaces)
       let validateCard = NSPredicate(format:"SELF MATCHES %@", regEx)
       let isvalidate = validateCard.evaluate(with: trimmedString)
       return isvalidate
    }
    
    public func validateDate(date: String) -> Bool {
       //date format MM/YY
       let regEx = "[0-1][0-9][1-9][0-9]"
       let trimmedString = date.trimmingCharacters(in: .whitespaces)
       let validateDate = NSPredicate(format:"SELF MATCHES %@", regEx)
       let isvalidate = validateDate.evaluate(with: trimmedString)
       return isvalidate
    }
    
    public func validateCVV(cvv: String) -> Bool {
       //needs to be 3 digits
       let regEx = "[0-9]{3}"
       let trimmedString = cvv.trimmingCharacters(in: .whitespaces)
       let validateCVV = NSPredicate(format:"SELF MATCHES %@", regEx)
       let isvalidate = validateCVV.evaluate(with: trimmedString)
       return isvalidate
    }
    
    
}
