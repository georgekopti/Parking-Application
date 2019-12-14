

import UIKit

class SingleReceiptVC: UIViewController {
    
    var parking : ParkingModel = ParkingModel()
    var user : User = User()
    
    
    
    @IBOutlet var lblCarPlate: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblDuration: UILabel!
    @IBOutlet var lblBuildingCode: UILabel!
    @IBOutlet var lblSuitNumber: UILabel!
    @IBOutlet var lblPrice: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lblCarPlate.text = "Car Plate: \(String(parking.plateNumber))"
        if(parking.parkingDate != nil){
            lblDate.text = "Date: \(parking.parkingDate!)"
        }else{
            lblDate.text = "Date: "
        }
        
        lblDuration.text = "Duration: \(String(parking.hoursParked)) Hours"
        lblBuildingCode.text = "Building Code: \(String(parking.buildingCode))"
        lblSuitNumber.text = "Suit Number: \(String(parking.suitNumber))"
        lblPrice.text = "Parking Price: $\(String(parking.parkingCost))"
        
    }
    
    @IBAction func onBackClick(){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let menuView = storyBoard.instantiateViewController(withIdentifier: "Menu") as! MenuVC
        menuView.user = user
        navigationController?.pushViewController(menuView, animated: true)
        
    }
    
    

}
