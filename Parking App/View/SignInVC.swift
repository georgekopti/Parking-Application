//
//  SignInVC.swift
//  Parking App
//
//  Created by Zakim Javer on 2019-11-19.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class SignInVC: UIViewController {
//
    var userData = UserData()
    var paymentData = PaymentData()
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBAction func SignInBtn() {
        print("check to see if user exists")
        //fjerfjirj@rfrf.com asdf123
        let user = User(email: self.email.text!, password: self.password.text!)
        let found = userData.checkUser(cUser: user)
        paymentData.checkPayment();
        print(found)
        if(found >= 0){
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let menuView = storyBoard.instantiateViewController(withIdentifier: "Menu") as! MenuVC
            menuView.user = userData.returnUser(id: found)
            navigationController?.pushViewController(menuView, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

     print("here")
     let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
     let signUp = mainSB.instantiateViewController(withIdentifier: "SignUp") as! SignUpVC
     self.present(signUp, animated: true, completion: nil)
     navigationController?.pushViewController(signUp, animated: true)
     
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
