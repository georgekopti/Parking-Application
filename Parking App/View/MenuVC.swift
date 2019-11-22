//
//  MenuVC.swift
//  Parking App
//
//  Created by Xcode User on 2019-11-22.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onSearchClick(){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let menuView = storyBoard.instantiateViewController(withIdentifier: "Search") as! SearchVC
        navigationController?.pushViewController(menuView, animated: true)
        
    }
    

}
