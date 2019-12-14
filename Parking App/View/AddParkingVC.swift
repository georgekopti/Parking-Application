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
    var validation = Validation()
    
    @IBOutlet var txtBuildingCode : UITextField!
    @IBOutlet var txtPlateNumber : UITextField!
    @IBOutlet var txtSuitNumber : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pig-1")!)
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
        
        //hello
        if(validate()){
            if(txtPlateNumber.text! == user.carPlateNo){
                self.txtBuildingCode.layer.borderColor = UIColor.clear.cgColor
                let parking : ParkingModel = ParkingModel(plateNumber: plateNumber,
                                                          buildingCode: buildingNumber!,
                                                          suitNumber: suitNumber!,
                                                          hoursParked: numberOfHours,
                                                          parkingDate: date,
                                                          parkingCost: price,
                                                          userId: user.id)
                
                let calanderDate = Calendar.current.dateComponents([.month], from: date)
                let month: Int = calanderDate.month!
                let parkingThisMonth = parkingData.getParkingCout(month: month, user_id: user.id)
                
                if(parkingThisMonth < 3){
                    parking.parkingCost = 0
                }
                
                parkingData.insertParking(newParking: parking)
                print("Done and Added")
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let singleReceiptView = storyBoard.instantiateViewController(withIdentifier: "SingleReceipt") as! SingleReceiptVC
                singleReceiptView.parking = parking
                singleReceiptView.user = user
                navigationController?.pushViewController(singleReceiptView, animated: true)
                
            }else{
                self.txtPlateNumber.layer.borderWidth = 1.0
                self.txtPlateNumber.layer.borderColor = UIColor.red.cgColor
            }
        }
    
        print(user.carPlateNo)
        
    }
    
    //validate user input
    func validate() -> Bool {
        var valide = true
        
        //validate
        if(!(self.validation.validateBuildingCode(buildingCode: txtBuildingCode.text!))){
            valide = false
            //changes border
            self.txtBuildingCode.layer.borderWidth = 1.0
            self.txtBuildingCode.layer.borderColor = UIColor.red.cgColor
        }else{
            self.txtBuildingCode.layer.borderColor = UIColor.clear.cgColor
        }
        
        
        if(!(self.validation.validateSuit(suit: txtSuitNumber.text!))){
            valide = false
            //changes border
            self.txtSuitNumber.layer.borderWidth = 1.0
            self.txtSuitNumber.layer.borderColor = UIColor.red.cgColor
        }else{
            self.txtSuitNumber.layer.borderColor = UIColor.clear.cgColor
        }
        
        
        
        return valide
    }

}
