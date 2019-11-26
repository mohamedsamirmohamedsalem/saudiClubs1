//
//  File.swift
//  projectV5
//
//  Created by Mohamed Samir on 11/20/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

//
//  ViewCorners.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/20/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

 class ImageCorners: UIImageView {

    override func layoutSubviews() {
            super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 18
    }
}
