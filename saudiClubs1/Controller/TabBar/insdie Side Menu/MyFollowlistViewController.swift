//
//  MyFollowlistViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/28/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class MyFollowlistViewController: UIViewController {

    @IBOutlet var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        TableView.tableFooterView = UIView()

    }

}

extension MyFollowlistViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFollowlistTableViewCell") as! MyFollowlistTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
