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
    
    @IBOutlet var ShowdAndHidedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MainCollectionViewCell.delegate = self
        MainCollectionViewCell.dataSource = self
        MainCollectionViewCell.RegisterNib(Cell: ButtonsCollectionViewCell.self)
        
    }
    
}

extension ButtonsCellTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(IndexPath: indexPath) as ButtonsCollectionViewCell
        return cell
    }
    
    
    
}
