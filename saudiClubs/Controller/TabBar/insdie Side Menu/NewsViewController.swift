//
//  NewsViewController.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/1/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

      @IBOutlet var TableView: UITableView!
         
         override func viewDidLoad() {
             super.viewDidLoad()
             TableView.delegate = self
             TableView.dataSource = self
             TableView.RegisterNib(Cell: NewsTableViewCell.self)
             TableView.tableFooterView = UIView()

         }

     }

     extension NewsViewController : UITableViewDelegate , UITableViewDataSource {
         
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return 3
         }
         
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeue(IndexPath: indexPath) as NewsTableViewCell
             return cell
         }
         
         func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
             return 150
         }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "newsDetailsVC") as! newsDetailsVC
                  present(storyBoard, animated: true, completion: nil)
           }
     }
