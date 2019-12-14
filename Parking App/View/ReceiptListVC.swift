//
//  ReceiptListVC.swift
//  Parking App
//
//  Created by Zakim Javer on 2019-12-13.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class ReceiptListVC: UITableViewController {

    var user : User = User()
    var parkings = [ParkingModel]()
    
    var parkingData = ParkingData()
    
    var list : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        parkings = parkingData.getAllParking(user_id: user.id)!
        tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parkings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ReceiptListTVC

        // Configure the cell...

        print(self.parkings[indexPath.row])
        cell.BuildingCode.text = "\(parkings[indexPath.row].parkingDate!)"

        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        let newVC = mainSB.instantiateViewController(identifier: "SingleReceipt") as! SingleReceiptVC
        
        //send the current contact to next scene
        newVC.parking = parkings[indexPath.row]
        newVC.user = user
        self.navigationController?.pushViewController(newVC, animated: true)
    }

}
