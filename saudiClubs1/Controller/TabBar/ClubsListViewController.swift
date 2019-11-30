//
//  ClubsListViewController.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 11/30/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ClubsListViewController: UIViewController {

    
  
    @IBOutlet var TableView: UITableView!
    @IBOutlet var SearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    SearchBar.delegate = self
         TableView.delegate = self
         TableView.dataSource = self
      SearchBar.backgroundImage = UIImage()
        TableView.RegisterNib(Cell: ClubsListTableViewCell.self)
    }
    



}

extension ClubsListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(IndexPath: indexPath) as ClubsListTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}
extension ClubsListViewController : UISearchBarDelegate {
    
}
