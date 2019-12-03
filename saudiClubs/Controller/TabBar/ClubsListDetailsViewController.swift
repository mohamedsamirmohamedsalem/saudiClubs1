//
//  ClubsListDetailsViewController.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/1/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ClubsListDetailsViewController : UIViewController {


    @IBOutlet var TableView: UITableView!
    override func viewDidLoad() {
          super.viewDidLoad()
    
          TableView.delegate = self
          TableView.dataSource = self
          setTableView()
          
      }
      
      func setTableView(){
          
         // TableView.estimatedRowHeight = 100
          TableView.rowHeight = UITableView.automaticDimension
          TableView.backgroundColor = UIColor.clear
         
      
        TableView.RegisterNib(Cell: ClubsListMainTableViewCell.self)
        TableView.RegisterNib(Cell: SliderTableViewCell.self)
        TableView.RegisterNib(Cell: RateClubTableViewCell.self)
        TableView.RegisterNib(Cell: ButtonsCellTableViewCell.self)
        

          TableView.reloadData()
      }
    
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          self.TableView.reloadData()
          self.TableView.beginUpdates()
          self.TableView.endUpdates()
        
      }
      
      override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
       }
}
  ///////////////////////////////////////////////////////////////////////
  extension ClubsListDetailsViewController : UITableViewDelegate , UITableViewDataSource {
      
      func numberOfSections(in tableView: UITableView) -> Int {
          return 4
      }
     // set view of header (before table view first cell) to be clear
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let v: UIView = UIView.init()
         v.backgroundColor = UIColor.clear
         return v
     }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
      }
      
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          if indexPath.section == 0 {
                return 50
          }else if indexPath.section == 1 {
                return 200
          }else if indexPath.section == 2{
             return 60
          }else if indexPath.section == 3{
            return 50
          }else if indexPath.section == 4{
             return 200
          }else{
            return 50
            
        }
      }
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
         if indexPath.section == 0 {
              let cell = tableView.dequeue(IndexPath: indexPath) as ClubsListMainTableViewCell
              cell.selectionStyle = .none
              cell.reloadData()
              return cell
          }else if indexPath.section == 1 {
             let cell = tableView.dequeue(IndexPath: indexPath) as SliderTableViewCell
                      cell.selectionStyle = .none
                      cell.reloadData()
                      return cell
          }else if indexPath.section == 2{
           let cell = tableView.dequeue(IndexPath: indexPath) as RateClubTableViewCell
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeue(IndexPath: indexPath) as ButtonsCellTableViewCell
                       cell.selectionStyle = .none
                       return cell
        }
      }
  }


