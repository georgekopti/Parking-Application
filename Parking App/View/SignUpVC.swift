//
//  SignUpVC.swift
//  Parking App
//
//  Created by Xcode User on 2019-11-15.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    //user info
    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtEmail : UITextField!
    @IBOutlet var txtPassword : UITextField!
    @IBOutlet var txtContactNumber : UITextField!
    @IBOutlet var txtCarPlateNumber : UITextField!
    
    //payment info
    @IBOutlet var txtCardNumber : UITextField!
    @IBOutlet var txtExpiryDate : UITextField!
    @IBOutlet var txtCVVNumber : UITextField!
    @IBOutlet var txtNameOnCard : UITextField!
    
    
    @IBAction func onSignUpClick(){
        print("sign up click")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    

    
}
