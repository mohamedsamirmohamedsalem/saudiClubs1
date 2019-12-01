//
//  ButtonsCellTableViewCell.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/1/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ButtonsCellTableViewCell: UITableViewCell {

    @IBOutlet var MainCollectionViewCell: UICollectionView!
    
    var items : [CircleModel]?{
        didSet {
            MainCollectionViewCell.reloadData()
        }
    }
    var didSelectItem: ( (CircleModel) -> () )?
    
    
    
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(IndexPath: indexPath) as ButtonsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = SCREEN_WIDTH / 3.7
        let height: CGFloat = 50
        return CGSize(width: width, height: height)
    }
    
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   let cell = collectionView.cellForItem(at: indexPath)
    if indexPath.section == 0 {
        ShowdAndHidedView.isHidden = true
        
    }else if indexPath.section == 1{
        print("9====================")
         ShowdAndHidedView.isHidden = false
    }else {
        ShowdAndHidedView.isHidden = false
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
