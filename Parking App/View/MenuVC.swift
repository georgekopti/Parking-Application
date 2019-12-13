
import UIKit

class MenuVC: UIViewController {
    
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
        
        //let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //let addParkingView = storyBoard.instantiateViewController(withIdentifier: "AddParking") as! AddParkingVC
        //addParkingView.user = user
        //navigationController?.pushViewController(addParkingView, animated: true)
        
    }
    

}
