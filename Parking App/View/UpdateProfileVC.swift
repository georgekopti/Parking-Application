//
//  UpdateProfileVC.swift
//  Parking App
//
//  Created by Zakim Javer on 2019-12-12.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class UpdateProfileVC: UIViewController {

    var id : Int = -1
    
    @IBOutlet var Name: UITextField!
    @IBOutlet var Email: UITextField!
    @IBOutlet var Password: UITextField!
    @IBOutlet var ContactNo: UITextField!
    @IBOutlet var PlateNo: UITextField!
    
    @IBOutlet var CardNo: UITextField!
    @IBOutlet var ExpiryDate: UITextField!
    @IBOutlet var CVV: UITextField!
    @IBOutlet var CardName: UITextField!
    
    
    
    //database helper
    var userData = UserData()
    var paymentData = PaymentData()
    var validation = Validation()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pig-1")!)
        let user = userData.returnUser(id: id)
        let payment = paymentData.returnPayment(id: id)
        
        print("Update pg: Email \(user.email)")
        //setting up the view with current details
        Name.text = user.name
        Email.text = user.email
        Password.text = user.password
        ContactNo.text = user.contactNo
        PlateNo.text = user.carPlateNo
        
        CardName.text = payment.cardholderName
        CardNo.text = payment.cardNumber
        CVV.text = payment.cvvNumber
        ExpiryDate.text = payment.expiryDate
        
        
    }

 
    @IBAction func Update(_ sender: Any) {
        let valide = validate()
        if(valide){
            let updatedUser = User(name: Name.text!, email: Email.text!, password: Password.text!, contactNo: ContactNo.text!, carPlateNo: PlateNo.text!)
            updatedUser.id = id
            
            let updatedPayment = PaymentModel(cardNumber: CardNo.text!, expiryDate: ExpiryDate.text!, cvvNumber: CVV.text!, cardholderName: CardName.text!, id: id)
            
            if(userData.updateUser(user: updatedUser) && paymentData.updatePayment(payment: updatedPayment)){
                //updated success
                let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let si = sb.instantiateViewController(withIdentifier: "Menu") as! MenuVC
                si.user = updatedUser
                navigationController?.pushViewController(si, animated: true)
            }
        }
    }
    
    
    @IBAction func Cancel(_ sender: Any) {
        let oldUser = userData.returnUser(id: id)
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let si = sb.instantiateViewController(withIdentifier: "Menu") as! MenuVC
        si.user = oldUser
        navigationController?.pushViewController(si, animated: true)
    }
    
    //
    func validate() -> Bool {
        var valide = true
        
        //validate user inpute
        if(!(self.validation.validateName(name: self.Name.text!))){
            valide = false
            //changes border
            self.Name.layer.borderWidth = 1.0
            self.Name.layer.borderColor = UIColor.red.cgColor
        }else{
            self.Name.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validateEmailId(emailID: self.Email.text!))){
            valide = false
            self.Email.layer.borderWidth = 1.0
            self.Email.layer.borderColor = UIColor.red.cgColor
        }else{
            self.Email.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validatePassword(password: self.Password.text!))){
            valide = false
            self.Password.layer.borderWidth = 1.0
            self.Password.layer.borderColor = UIColor.red.cgColor
        }else{
            self.Password.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validaPhoneNumber(phoneNumber: self.ContactNo.text!))){
            valide = false
            self.ContactNo.layer.borderWidth = 1.0
            self.ContactNo.layer.borderColor = UIColor.red.cgColor
        }else{
            self.ContactNo.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validatePlateNumber(plate: self.PlateNo.text!))){
            valide = false
            self.PlateNo.layer.borderWidth = 1.0
            self.PlateNo.layer.borderColor = UIColor.red.cgColor
        }else{
            self.PlateNo.layer.borderColor = UIColor.clear.cgColor
        }
        
        //payment information validation
        if(!(self.validation.validateCardNumber(card: self.CardNo.text!))){
            valide = false
            self.CardNo.layer.borderWidth = 1.0
            self.CardNo.layer.borderColor = UIColor.red.cgColor
        }else{
            self.CardNo.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validateDate(date: self.ExpiryDate.text!))){
            valide = false
            self.ExpiryDate.layer.borderWidth = 1.0
            self.ExpiryDate.layer.borderColor = UIColor.red.cgColor
        }else{
            self.ExpiryDate.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validateCVV(cvv: self.CVV.text!))){
            valide = false
            self.CVV.layer.borderWidth = 1.0
            self.CVV.layer.borderColor = UIColor.red.cgColor
        }else{
            self.CVV.layer.borderColor = UIColor.clear.cgColor
        }
        
        if(!(self.validation.validateName(name: self.CardName.text!))){
            valide = false
            self.CardName.layer.borderWidth = 1.0
            self.CardName.layer.borderColor = UIColor.red.cgColor
        }else{
            self.CardName.layer.borderColor = UIColor.clear.cgColor
        }
        
        return valide
    }

}
