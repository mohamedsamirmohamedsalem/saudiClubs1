//
//  BottomMainTableViewCell.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/1/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class BottomMainTableViewCell: UITableViewCell {

    @IBOutlet var MainCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      //  MainCollectionView.delegate = self
      //  MainCollectionView.dataSource = self
      //  MainCollectionView.RegisterNib(Cell: FirstBottomCell.self)
        
    }
  
}
//extension BottomMainTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//      //  let cell = collectionView.dequeue(IndexPath: indexPath) as FirstBottomCell
//        return uicolle
//    }
//
//      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//          let width: CGFloat = SCREEN_WIDTH
//          let height: CGFloat = 60
//          return CGSize(width: width, height: height)
//      }
//}
