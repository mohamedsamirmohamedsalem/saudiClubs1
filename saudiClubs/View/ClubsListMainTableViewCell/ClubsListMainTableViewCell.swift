//
//  ClubsListMainTableViewCell.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 11/30/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ClubsListMainTableViewCell: UITableViewCell {
    
    @IBOutlet var MainCollectionViewCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MainCollectionViewCell.delegate = self
        MainCollectionViewCell.dataSource = self
        
        MainCollectionViewCell.RegisterNib(Cell: ClubsdetailsCollectionViewCell.self)
    }
    
    func reloadData() {
        MainCollectionViewCell.reloadData()
    }
}

extension ClubsListMainTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //   let tempCatgories = categories[indexPath.row]
        let cell = collectionView.dequeue(IndexPath: indexPath ) as ClubsdetailsCollectionViewCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = SCREEN_WIDTH
        let height: CGFloat = 50
        return CGSize(width: width, height: height)
    }
    
    
}



