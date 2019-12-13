//
//  AddParkingVC.swift
//  Parking App
//
//  Created by Xcode User on 2019-12-12.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class AddParkingVC: UIViewController {
    
    var parkingData = ParkingData()
    var user : User = User()
    
    @IBOutlet var txtBuildingCode : UITextField!
    @IBOutlet var txtPlateNumber : UITextField!
    @IBOutlet var txtSuitNumber : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var numberOfHours : Int = 1
    var price : Int = 4
    
    @IBAction func indexChanged(sender : UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            numberOfHours = 1
            price = 4
        case 1:
            numberOfHours = 3
            price = 8
        case 2:
            numberOfHours = 10
            price = 12
        case 3:
            numberOfHours = 24
            price = 20
        default:
            break;
        }
    }
    
    
    @IBAction func onAddParkingClick(){
        
        let plateNumber = txtPlateNumber.text!
        let buildingNumber = Int(txtBuildingCode.text!)
        let suitNumber = Int(txtSuitNumber.text!)
        let date = Date()
        
        
        if(txtPlateNumber.text! == user.carPlateNo){
            
            let parking : ParkingModel = ParkingModel(plateNumber: plateNumber,
                                                      buildingCode: buildingNumber!,
                                                      suitNumber: suitNumber!,
                                                      hoursParked: numberOfHours,
                                                      parkingDate: date,
                                                      parkingCost: price,
                                                      userId: user.id)
            
            parkingData.insertParking(newParking: parking)
            print("Done and Added")
            
        }
    
        print(user.carPlateNo)
        
    }

}
