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
    var parkingData = ParkingData()
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var rememberMe: UISwitch!
    
    
    
    
    func rememberData(){
        UserDefaults.standard.set(self.email.text, forKey: "USERNAME")
        UserDefaults.standard.set(self.password.text, forKey: "PASSWORD")
    }
    
    func getRememberedData(){
        if let email = UserDefaults.standard.value(forKey: "USERNAME"){
            self.email.text = email as? String
        }
        
        if let password = UserDefaults.standard.value(forKey: "PASSWORD"){
            self.password.text = password as? String
        }
    }
    
    func forgetData(){
        if let _ = UserDefaults.standard.value(forKey: "USERNAME"){
            UserDefaults.standard.removeObject(forKey: "USERNAME")
        }
        
        if let _ = UserDefaults.standard.value(forKey: "PASSWORD"){
            UserDefaults.standard.removeObject(forKey: "PASSWORD")
        }
    }

    
    
    
    
    
    @IBAction func SignInBtn() {
        print("check to see if user exists")
        //fjerfjirj@rfrf.com asdf123
        let user = User(email: self.email.text!, password: self.password.text!)
        let found = userData.checkUser(cUser: user)
        paymentData.checkPayment();
        print(found)
        if rememberMe.isOn {
            //save data from UserDefaults
            self.rememberData()
        }else{
            //remove data from UserDefaults
            self.forgetData()
        }
        if(found >= 0){
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let menuView = storyBoard.instantiateViewController(withIdentifier: "Menu") as! MenuVC
            menuView.user = userData.returnUser(id: found)
            navigationController?.pushViewController(menuView, animated: true)
        }
    }
    
    @IBAction func onForgotClick(){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let forgotView = storyBoard.instantiateViewController(withIdentifier: "Forgot") as! ForgotPasswordVC
        navigationController?.pushViewController(forgotView, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.getRememberedData()
        //let all_parking : [ParkingModel] = parkingData.getAllParking(user_id: 2)!
        
        //for parking in all_parking{
        //    print(parking.parkingDate!)
       // }
        
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
