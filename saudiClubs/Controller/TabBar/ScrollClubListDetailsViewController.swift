//
//  ScrollClubListDetailsViewController.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/3/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ScrollClubListDetailsViewController: UIViewController {
    
    
    let images = [#imageLiteral(resourceName: "bank"), #imageLiteral(resourceName: "news_img"), #imageLiteral(resourceName: "user-img"), #imageLiteral(resourceName: "good-rate"), #imageLiteral(resourceName: "club-img")]
   
    
    var currentIndex = 0
    var timer: Timer?
    
    // Outlets
    @IBOutlet var BContainerView: UIView!
    @IBOutlet var ButtonCollectionView: UICollectionView!
    @IBOutlet weak var Collection: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = 5
        
        //BContainerView.addSubview(FirstCellInDetails)
        title = "تطبيق الانديه السعوديه"    
        startTimer()

    }

  
    func startTimer()  {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(go), userInfo: nil, repeats: true)
    }
    
    @objc func go()  {
     
        print("========")
        let scrollPosition = currentIndex < images.count - 1 ? currentIndex + 1 : 0
        
        Collection.scrollToItem(at: IndexPath(item: scrollPosition, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}

extension ScrollClubListDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return 4
        }else {
            return 4
        
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardCell", for: indexPath) as! OnBoardCell
            cell.ButOut.setTitle(cell.butContent[indexPath.row], for: .normal)
           return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newcell", for: indexPath) as! newcell
            cell.image_ = images[indexPath.row]
            return cell
        }
    }
    
    // function to controling the size of collectionView Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 0 {
            return CGSize(width: ButtonCollectionView.frame.width/3 , height: 50)
        }else{
             return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) { // Mark Slider
        if scrollView.tag == 1 {
            
            currentIndex = Int(scrollView.contentOffset.x / Collection.frame.width)
            
            
            
            pageControl.currentPage = currentIndex
            print(scrollView.contentOffset.x / Collection.frame.width)
            timer?.invalidate()
            startTimer()
            
        }
    }
}
