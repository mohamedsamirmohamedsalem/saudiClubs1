//
//  UICollectionView+Generics.swift
//  projectV5
//
//  Created by Mohamed Samir on 11/11/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView{
     //Simple way to Register Collection view using nib file
    func RegisterNib<Cell : UICollectionViewCell>(Cell : Cell.Type){
        
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }

     //Simple way to deque cell using class name automatically
    func dequeue<Cell : UICollectionViewCell>(IndexPath : IndexPath) -> Cell{
        
        let identifier = String(describing: Cell.self)
        //let CellForIndex = Cell as UITableViewCell
        guard let Cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: IndexPath ) as? Cell  else {
            fatalError("there is no Cell")
        }
        return Cell
    }
}
