//
//  MenuVC.swift
//  Parking App
//
//  Created by Xcode User on 2019-11-22.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

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
    
    @IBAction func Update() {
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let si = sb.instantiateViewController(withIdentifier: "UpdateProfile") as! UpdateProfileVC
        si.id = user.id
        navigationController?.pushViewController(si, animated: true)
    }
    
    
}
