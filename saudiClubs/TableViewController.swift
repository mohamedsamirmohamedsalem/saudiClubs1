//
//  TableViewController.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/2/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
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
        return 5
    }

 
//    override var isSelected : Bool{
//        didSet{
//            if self.isSelected == true {
//                print("uydhui")
//            }else {
//                  print("uydhui")
//            }
//        }
//    }
//
    
    

}
