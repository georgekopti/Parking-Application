

import UIKit

class SingleReceiptVC: UIViewController {
    
    var parking : ParkingModel = ParkingModel()
    
    @IBOutlet var lblCarPlate: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblDuration: UILabel!
    @IBOutlet var lblBuildingCode: UILabel!
    @IBOutlet var lblSuitNumber: UILabel!
    @IBOutlet var lblPrice: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblCarPlate.text = "Car Plate: \(String(parking.plateNumber))"
        lblDate.text = "Date: \(String(describing: parking.parkingDate!))"
        lblDuration.text = "Duration: \(String(parking.hoursParked)) Hours"
        lblBuildingCode.text = "Building Code: \(String(parking.buildingCode))"
        lblSuitNumber.text = "Suit Number: \(String(parking.suitNumber))"
        lblPrice.text = "Parking Price: \(String(parking.parkingCost))"
        
    }
    
    

}
