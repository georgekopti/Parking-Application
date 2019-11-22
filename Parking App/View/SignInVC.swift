//
//  SignInVC.swift
//  Parking App
//
//  Created by Zakim Javer on 2019-11-19.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signup(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signupVC = storyBoard.instantiateViewController(withIdentifier: "SignUpScene") as! SignUpVC
        navigationController?.pushViewController(signupVC, animated: true)
        
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
