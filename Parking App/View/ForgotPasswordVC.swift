//
//  ForgotPasswordVC.swift
//  Parking App
//
//  Created by Xcode User on 2019-12-13.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    var userData = UserData()
    
    @IBOutlet var lblPassword: UILabel!
    @IBOutlet var txtEmail: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onGetPasswordClick(){
        
        let email = txtEmail.text!
        
        var users = userData.getAllUsers()!
        
        for user in users{
            
            if(user.value(forKey: "email") as! String == email){
                
                lblPassword.text = "password: \(String(describing: user.value(forKey: "password")))"
                
            }
            
        }
        
        
        
        
        
        
    }

}
