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
        if SCREEN_HEIGHT == 667{ //iPhone 8 /iPhone 7 /iPhone 6 / iPhone 6s
            return SCREEN_HEIGHT / 2.6
        }else if SCREEN_HEIGHT ==  736 { //iPhone 8 Plus / Phone 7 Plus
            return SCREEN_HEIGHT / 2.8
        }else if SCREEN_HEIGHT ==  812 {//iPhone X
            return SCREEN_HEIGHT / 2.9
        }else if SCREEN_HEIGHT ==  896 { //iPhone 11
            return SCREEN_HEIGHT / 3.1
        }else if SCREEN_HEIGHT >  896 { // ipad
            return SCREEN_HEIGHT / 3.2
        }else {
            return SCREEN_HEIGHT / 3
        }
    }
    
}
extension ClubsListViewController : UISearchBarDelegate {
    
}
