//
//  SignInController.swift
//  Parking App
//
//  Created by Zakim Javer on 2019-11-15.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class SignInController: UIViewController {


    @IBAction func SignUp(_ sender: UIButton) {
        print("here")
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUp = mainSB.instantiateViewController(withIdentifier: "SignUp") as! SignUp
        //receiptVC.billAmount = self.billAmount
        self.present(signUp, animated: true, completion: nil)
        navigationController?.pushViewController(signUp, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func openScene(){
        
    }

}
