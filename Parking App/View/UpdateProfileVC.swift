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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = userData.returnUser(id: id)
        let payment = paymentData.returnPayment(id: id)
        
        print("Update pg: email \(user.email)")
        //setting up the view with current details
        Name.text = user.name
        //self.Email.text = user.email
        Password.text = user.password
        ContactNo.text = user.contactNo
        PlateNo.text = user.carPlateNo
        
        CardName.text = payment.cardholderName
        CardNo.text = payment.cardNumber
        CVV.text = payment.cvvNumber
        ExpiryDate.text = payment.expiryDate
        
        
    }

 
    @IBAction func Update(_ sender: Any) {
        print("Email: \(Email.text ?? "")")
    }
    //let updatedUser = User(name: Name.text!, email: Email.text!, password: Password.text!, contactNo: ContactNo.text!, carPlateNo: PlateNo.text!)
    //
    

}
