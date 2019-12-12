//
//  SignUpVC.swift
//  Parking App
//
//  Created by Xcode User on 2019-11-15.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    //getting the sign up details
    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var contactNo: UITextField!
    @IBOutlet var plateNo: UITextField!
    
    //payment info
    @IBOutlet var cardNo: UITextField!
    @IBOutlet var expiryDate: UITextField!
    @IBOutlet var cvv: UITextField!
    @IBOutlet var cardName: UITextField!
    
    //validation helper
    var validation = Validation()
    var userData = UserData()
    var paymentData = PaymentData()
    
    @IBAction func SignUp() {
        print("Sign up fuction")
        addUserData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //adding data to db
    func addUserData(){
        let valide = validate()
        if(valide){
            let user = User(name: self.name.text!, email: self.email.text!, password: self.password.text!, contactNo: self.contactNo.text!, carPlateNo: self.plateNo.text!)
            userData.addUser(newTask: user)
            
            //adding payment 
            let payment = PaymentModel(cardNumber: self.cardNo.text!, expiryDate: self.expiryDate.text!, cvvNumber: self.cvv.text!, cardholderName: self.cardName.text!, email: self.email.text!)
            print("payment info: " + payment.cardholderName)
            paymentData.insertPayment(newPayment: payment)
            
            print("Add to database")
            let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let si = sb.instantiateViewController(withIdentifier: "SignIn") as! SignInVC
            navigationController?.pushViewController(si, animated: true)
        }
    }
    
    //validate user input
    func validate() -> Bool {
        var valide = true
        
        //validate user inpute
        if(!(self.validation.validateName(name: self.name.text!))){
            valide = false
            //changes border
            self.name.layer.borderWidth = 1.0
            self.name.layer.borderColor = UIColor.red.cgColor
        }else{
            self.name.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validateEmailId(emailID: self.email.text!))){
            valide = false
            self.email.layer.borderWidth = 1.0
            self.email.layer.borderColor = UIColor.red.cgColor
        }else{
            self.email.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validatePassword(password: self.password.text!))){
            valide = false
            self.password.layer.borderWidth = 1.0
            self.password.layer.borderColor = UIColor.red.cgColor
        }else{
            self.password.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validaPhoneNumber(phoneNumber: self.contactNo.text!))){
            valide = false
            self.contactNo.layer.borderWidth = 1.0
            self.contactNo.layer.borderColor = UIColor.red.cgColor
        }else{
            self.contactNo.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validatePlateNumber(plate: self.plateNo.text!))){
            valide = false
            self.plateNo.layer.borderWidth = 1.0
            self.plateNo.layer.borderColor = UIColor.red.cgColor
        }else{
            self.plateNo.layer.borderColor = UIColor.clear.cgColor
        }
        
        //payment information validation
        if(!(self.validation.validateCardNumber(card: self.cardNo.text!))){
            valide = false
            self.cardNo.layer.borderWidth = 1.0
            self.cardNo.layer.borderColor = UIColor.red.cgColor
        }else{
            self.cardNo.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validateDate(date: self.expiryDate.text!))){
            valide = false
            self.expiryDate.layer.borderWidth = 1.0
            self.expiryDate.layer.borderColor = UIColor.red.cgColor
        }else{
            self.expiryDate.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validateCVV(cvv: self.cvv.text!))){
            valide = false
            self.cvv.layer.borderWidth = 1.0
            self.cvv.layer.borderColor = UIColor.red.cgColor
        }else{
            self.cvv.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validateName(name: self.cardName.text!))){
            valide = false
            self.cardName.layer.borderWidth = 1.0
            self.cardName.layer.borderColor = UIColor.red.cgColor
        }else{
            self.cardName.layer.borderColor = UIColor.clear.cgColor
        }
        
        return valide
    }
    
    

    
}
