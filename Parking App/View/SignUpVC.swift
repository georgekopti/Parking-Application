//
//  SignUpVC.swift
//  Parking App
//
//  Created by Xcode User on 2019-11-15.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPlateNumber: UITextField!
    @IBOutlet weak var txtCardNumber: UITextField!
    @IBOutlet weak var txtCardExpireDate: UITextField!
    @IBOutlet weak var txtCardCvv: UITextField!
    @IBOutlet weak var txtCardHolderName: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    let userController = UserController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Sign Up"
        
        let doneButton = UIBarButtonItem(title: "Submit", style: .plain, target: self, action:   #selector(doSubmitClick))
        self.navigationItem.rightBarButtonItem = doneButton
        // Do any additional setup after loading the view.
        
    }
    
    @objc private func doSubmitClick(){
        let name = txtName.text!
        let email = txtEmail.text!
        let password = txtPassword.text!
        let phoneNumber = txtPhoneNumber.text!
        let plateNumber = txtPlateNumber.text!
        let cardNumber = txtCardNumber.text!
        let cardExpiryString = txtCardExpireDate.text!
        let cardCvv = txtCardCvv.text!
        let cardholderName = txtCardHolderName.text!
        
        let cardExpiryDate = cardExpiryString.toDate()
        
        
        let newUser = User(name: name, email: email, password: password, phoneNumber: phoneNumber, plateNumber: plateNumber, cardNumber: cardNumber, expiryDate: cardExpiryDate!, cvvNumber: cardCvv, cardholderName: cardholderName)
        
        
        if newUser != nil{
            userController.insertUser(newUser: newUser)
            
            var allUsers = (self.userController.getAllUsers() ?? nil)!
            
            if (allUsers != nil){
                for user in allUsers{
                    print(user.value(forKey: "name") as! String, " ",
                          user.value(forKey: "email") as! String, " ",
                          user.value(forKey: "password") as! String)
                }
            }
            
            _ = navigationController?.popViewController(animated: true)
        }else{
            print("User creation unsuccessful")
        }
    }
    
}
