//
//  SliderMainCollectionViewCell.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 11/30/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class SliderMainCollectionViewCell: UITableViewCell {

    //MARK :- Instance Variables
       //for timer using
       var scrollCurentIndex = 0
       var timer : Timer?
       let imageArray : [UIImage] = [#imageLiteral(resourceName: "FindFoods"),#imageLiteral(resourceName: "Fast Delivery"),#imageLiteral(resourceName: "Live tracking")]
       let firstLabelArray : [String] = ["Find Foods You Love","Fast Delivery","Live Tracking","Find Foods You Love","Fast Delivery"]
       let secondLabelArray : [String] = ["Discover the best foods from over 1,000 resturant","Fast delivery to your home,office and wherever you are","Real live tracking of your food on the app after ordered","Find Foods You Love","Fast Delivery"]
       
    
    //MARK :- IBOutlet
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet var MainCollectionViewCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pageController.numberOfPages = imageArray.count
               startTimer()
    }
   


    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(go), userInfo: nil, repeats: true)
    }
   
    @objc func go(){
        let scrollPosition = scrollCurentIndex < imageArray.count - 1 ? scrollCurentIndex + 1 : 0
        print(scrollCurentIndex)
        MainCollectionViewCell.scrollToItem(at: IndexPath(item: scrollPosition, section: 0), at: .centeredHorizontally, animated: true)
        

    }
}
////////////////////////
///////////
    

////////////////////////////////////////////////////////////////////////////////////////

extension SliderMainCollectionViewCell : UICollectionViewDelegate  , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(IndexPath: indexPath) as SliderCollectionViewCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollCurentIndex = Int(scrollView.contentOffset.x / MainCollectionViewCell.frame.width)
        pageController.currentPage = scrollCurentIndex
    }
    
}

