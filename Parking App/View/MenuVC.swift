
import UIKit

class MenuVC: UIViewController {
    
    
    var parkingData = ParkingData()
    var user : User = User()
    
    
    @IBOutlet var userInfo: UILabel!
    
    override func viewDidLoad() {
        userInfo.text = "Welcome "+user.name
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onSearchClick(){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let menuView = storyBoard.instantiateViewController(withIdentifier: "Search") as! SearchVC
        navigationController?.pushViewController(menuView, animated: true)
        
    }
    
    @IBAction func onAddParkingClick(){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addParkingView = storyBoard.instantiateViewController(withIdentifier: "AddParking") as! AddParkingVC
        addParkingView.user = user
        navigationController?.pushViewController(addParkingView, animated: true)
        
    }
    
    
    @IBAction func SignOut() {
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let si = sb.instantiateViewController(withIdentifier: "SignIn") as! SignInVC
        navigationController?.pushViewController(si, animated: true)
    }
    
    @IBAction func onUpdateClick(){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let updateView = storyBoard.instantiateViewController(withIdentifier: "UpdateProfile") as! UpdateProfileVC
        updateView.id = user.id
        navigationController?.pushViewController(updateView, animated: true)
        
    }
    
    @IBAction func onViewReceiptClick(){
        
        let all_parking : [ParkingModel] = parkingData.getAllParking(user_id: user.id)!
        let parking : ParkingModel = all_parking.last!
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let singleReceiptView = storyBoard.instantiateViewController(withIdentifier: "SingleReceipt") as! SingleReceiptVC
        singleReceiptView.parking = parking
        singleReceiptView.user = user
        navigationController?.pushViewController(singleReceiptView, animated: true)
        
        
    }
    @IBAction func ParkingList() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let updateView = storyBoard.instantiateViewController(withIdentifier: "ListParking") as! ReceiptListVC
        navigationController?.pushViewController(updateView, animated: true)
    }
    
    @IBAction func ParkingManual(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let updateView = storyBoard.instantiateViewController(withIdentifier: "ParkingManual") as! ParkingManualVC
        navigationController?.pushViewController(updateView, animated: true)

        
    }
    
    
    @IBAction func CustomerSupport(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let updateView = storyBoard.instantiateViewController(withIdentifier: "CustomerSupport") as! CustomerSupportVC
        navigationController?.pushViewController(updateView, animated: true)
        
    }
    
    
}
