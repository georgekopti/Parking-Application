//
//  ReceiptListVC.swift
//  Parking App
//
//  Created by Zakim Javer on 2019-12-13.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit

class ReceiptListVC: UITableViewController {

    var list : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        list.append("Gap")
        list.append("New")
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
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ReceiptListTVC

        // Configure the cell...

        print(self.list[indexPath.row])
        cell.BuildingCode.text = self.list[indexPath.row]

        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }

}
