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
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pig-1")!)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onGetPasswordClick(){
        
        let email = txtEmail.text!
        
        let users = userData.getAllUsers()!
        
        var password = "User does not exist"
        for user in users{
            
            if(user.value(forKey: "email") as! String == email){
                password = "Password: \(String(describing: user.value(forKey: "password")!))"
            }
        }
        
        lblPassword.text = password
        
        
    }

}
