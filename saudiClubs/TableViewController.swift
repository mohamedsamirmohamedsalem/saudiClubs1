//
//  TableViewController.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/2/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//


import UIKit
import MaterialComponents.MaterialPageControl


class TableViewController: UITableViewController {

    
    @IBOutlet var firstView: UIView!

    let pageControl = MDCPageControl()
      //MARK :- IBOutlet
       @IBOutlet weak var pageController: UIPageControl!
       @IBOutlet weak var CollectionView: UICollectionView!
    
    
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    var currentPage = 0
    var contentOffset : CGPoint!
    var infinteSlider: [UIImage] = images
    var timer: Timer?
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
    
            
            //CollectionView.register(UINib(nibName: "SingleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SingleCollectionViewCell")
            
            CollectionView.RegisterNib(Cell: SingleCollectionViewCell.self)
            
            
            infinteSlider = images
        startTimer()
      }
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
        }
    }
    
    @objc func scrollAutomatically(_ timer1: Timer) {
        
        if let coll  = CollectionView {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.item)!  < infinteSlider.count - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.item)! + 1, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
                
            }
        }
    }
    
    
     func reloadData()
    {

        
        if infinteSlider.count > 1
        {
            startTimer()
        }
        
        CollectionView.reloadData()
        
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
}

extension TableViewController : UICollectionViewDelegate , UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infinteSlider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeue(IndexPath: indexPath ) as SingleCollectionViewCell
        
        pageControl.numberOfPages = images.count
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.Img.image = infinteSlider[indexPath.row]
        
        return cell
        
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {

        pageControl.scrollViewDidScroll(scrollView)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        pageControl.scrollViewDidEndDecelerating(scrollView)
    }
    
    override func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    
    /*
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
     //        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "opens_at"), object: self, userInfo: ["type" : silder.sliderOpensText ?? "","currentView" : containerVc!])
     let silder = infinteSlider[indexPath.item]
     
     OpenViewsHandler.viewsToNavigate(opensType:silder.sliderOpensText ?? "", currentView: containerVc!, url: silder.slider_URL , currentTab: containerVc?.tabBarController?.selectedIndex)
     
     }
     
     */
    
}

extension TableViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

