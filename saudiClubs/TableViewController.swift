//
//  TableViewController.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/2/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    @IBOutlet var firstView: UIView!
   // @IBOutlet var secondView: UIView!
    
    //slider
    //

    //MARK :- Instance Variables
    //for timer using
    var scrollCurentIndex = 0
    var timer : Timer?
    let imageArray : [UIImage] = [#imageLiteral(resourceName: "club-img"),#imageLiteral(resourceName: "user-img"),#imageLiteral(resourceName: "news_smallimg"),#imageLiteral(resourceName: "news_smallimg"),#imageLiteral(resourceName: "user-img"),#imageLiteral(resourceName: "news_smallimg"),#imageLiteral(resourceName: "news_smallimg"),#imageLiteral(resourceName: "news_smallimg")]
   
    
    
    //MARK :- IBOutlet
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        pageController.numberOfPages = imageArray.count
        startTimer()
        
    }
    

    /////////////////////////////////////

    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(go), userInfo: nil, repeats: true)
    }
    
    @objc func go(){
        let scrollPosition = scrollCurentIndex < imageArray.count - 1 ? scrollCurentIndex + 1 : 0
        print(scrollCurentIndex)
        collectionView.scrollToItem(at: IndexPath(item: scrollPosition, section: 0), at: .centeredHorizontally, animated: true)
        

        
    // MARK: - Table view data source

        func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

}
extension TableViewController : UICollectionViewDelegate  , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
               return imageArray.count
           }
           
           func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardCell", for: indexPath) as! OnBoardCell
               cell.onBoardImage.image = imageArray[indexPath.row]
          
               return cell
               
           }
           
           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
               return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
           }
           
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
               scrollCurentIndex = Int(scrollView.contentOffset.x / collectionView.frame.width)
               pageController.currentPage = scrollCurentIndex
           }
           
    
       
        }

