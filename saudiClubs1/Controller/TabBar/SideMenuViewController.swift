//
//  SideMenuViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/28/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {


    @IBOutlet var personalImage: UIImageView!
    @IBOutlet var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      TableView.delegate = self
            TableView.dataSource = self
            // delete seprated lines after end of table lines
            TableView.tableFooterView = UIView()
    }
    

}

extension SideMenuViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell") as! SideMenuTableViewCell
            cell.sideMenuLabel.text = cell.sideMenuText[indexPath.row]
            
               return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREEN_HEIGHT / 15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
           
        }else if indexPath.row == 1 {
            
        }else if indexPath.row == 2 {
              let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MyFollowlistViewController") as! MyFollowlistViewController
                            self.present(storyBoard, animated: true, completion: nil)
        }else if indexPath.row == 3 {
          
        }else if indexPath.row == 4 {
           
        }else if indexPath.row == 5 {
           
        }else if indexPath.row == 6 {
           
        }else{
            print("Unknown Error")
        }
    }
}
