//
//  ClubsListViewController.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 11/30/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ClubsListViewController: UIViewController {
    
    
    
    @IBOutlet var NameLb: UILabel!
    @IBOutlet var NotificationButt: UIButton!
    @IBOutlet var TableView: UITableView!
    @IBOutlet var SearchBar: UISearchBar!
    @IBOutlet var StackView: UIStackView!
    @IBOutlet var searchStackBar: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // SearchBar.delegate = self
        TableView.delegate = self
        TableView.dataSource = self
          SearchBar.delegate = self
        searchStackBar.isHidden = true
             SearchBar.backgroundImage = UIImage()
        TableView.RegisterNib(Cell: AnnouncementTableViewCell.self)
        TableView.RegisterNib(Cell: ClubsListTableViewCell.self)
        TableView.rowHeight = UITableView.automaticDimension
        //  TableView.backgroundColor = UIColor.clear
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.TableView.reloadData()
        self.TableView.beginUpdates()
        self.TableView.endUpdates()
        //remove table views hight
         
        TableView.sectionHeaderHeight = 15
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func ShowAndHideSearchBar(_ sender: UIButton) {
        if sender.tag == 0 {
            UIView.animate(withDuration: 3) {
                self.StackView.isHidden = true
                self.searchStackBar.isHidden = false
            }
        }else {
            UIView.animate(withDuration: 3) {
                self.StackView.isHidden = false
                self.searchStackBar.isHidden = true
            }
        }
        self.view.layoutIfNeeded()
        self.view.endEditing(true)
    }
    
}

extension ClubsListViewController : UITableViewDelegate , UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // set view of header (before table view first cell) to be clear
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v: UIView = UIView.init()
        v.backgroundColor = UIColor.clear
        
        return v
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeue(IndexPath: indexPath) as AnnouncementTableViewCell
            //
            //this for change backgroundColor of cell when select it
            let backgroundView = UIView()
            backgroundView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell.selectedBackgroundView = backgroundView
            //
            cell.selectionStyle = .none
            return cell
        }else {
            let cell = tableView.dequeue(IndexPath: indexPath) as ClubsListTableViewCell
            //
            //this for change backgroundColor of cell when select it
            let backgroundView = UIView()
            backgroundView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell.selectedBackgroundView = backgroundView
            //
            return cell
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ClubsListDetailsViewController") as! ClubsListDetailsViewController
        present(storyBoard, animated: true, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        }else {
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
    
}
extension ClubsListViewController : UISearchBarDelegate {
 
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        // You could also change the position, frame etc of the searchBar
        self.StackView.isHidden = false
                 self.SearchBar.isHidden = true
        print("sgjdsdsdsdsdsdsdsd")
    }
}
