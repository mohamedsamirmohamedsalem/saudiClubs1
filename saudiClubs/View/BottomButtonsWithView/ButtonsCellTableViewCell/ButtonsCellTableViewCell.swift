//
//  ButtonsCellTableViewCell.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/1/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ButtonsCellTableViewCell: UITableViewCell {
    
    @IBOutlet var firstView: UIView!
    @IBOutlet var secondView: UIView!
    
    @IBOutlet var MainCollectionViewCell: UICollectionView!
    @IBOutlet var ShowdAndHidedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        MainCollectionViewCell.delegate = self
        MainCollectionViewCell.dataSource = self
        MainCollectionViewCell.RegisterNib(Cell: ButtonsCollectionViewCell.self)
    //    MainCollectionViewCell.scrollToLast()
    }
    
    
}

extension ButtonsCellTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(IndexPath: indexPath) as ButtonsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = SCREEN_WIDTH / 3.8
        let height: CGFloat = 60
        return CGSize(width: width, height: height)
    }
    
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   let cell = collectionView.cellForItem(at: indexPath)
    if indexPath.section == 0 {
        print("999999====================")
        firstView.isHidden = true
        secondView.isHidden = false
        
    }else if indexPath.section == 1{
         firstView.isHidden = false
               secondView.isHidden = true
         
    }else if indexPath.section == 2 {
        firstView.isHidden = true
        secondView.isHidden = false
    }else{
        firstView.isHidden = false
        secondView.isHidden = true
    }

  }
}
//extension UICollectionView {
//    func scrollToLast() {
//        guard numberOfSections > 0 else {
//            return
//        }
//
//        let lastSection = numberOfSections - 1
//
//        guard numberOfItems(inSection: lastSection) > 0 else {
//            return
//        }
//
//        let lastItemIndexPath = IndexPath(item: numberOfItems(inSection: lastSection) - 1,section: lastSection)
//        scrollToItem(at: lastItemIndexPath, at: .left
//            , animated: true)
//    }
//
//
//
//}
