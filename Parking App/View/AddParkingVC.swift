//
//  AddParkingVC.swift
//  Parking App
//
//  Created by Xcode User on 2019-12-12.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class AddParkingVC: UIViewController {
    
    var user : User = User()
    
    @IBOutlet var txtBuildingCode : UITextField!
    @IBOutlet var txtPlateNumber : UITextField!
    @IBOutlet var txtSuitNumber : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var numberOfHours : Int = 1
    
    @IBAction func indexChanged(sender : UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            numberOfHours = 1
        case 1:
            numberOfHours = 3
        case 2:
            numberOfHours = 10
        case 3:
            numberOfHours = 24
        default:
            break;
        }
    }
    
    
    @IBAction func onAddParkingClick(){
        
        
        if(txtPlateNumber.text! == user.carPlateNo){
            
            
            
        }
        
        
        
        print(user.carPlateNo)
        //let date = Date()
        
        //print(txtBuildingCode.text!)
        //print(numberOfHours)
        //print(txtPlateNumber.text!)
        //print(txtSuitNumber.text!)
        
        
        
        //print(date)
        
        
    
        
    }
    



}
