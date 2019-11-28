//
//  SideMenuTableViewCell.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/28/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    var sideMenuText = ["استعراض الانديه السعوديه","البحث عن نادي","قائمة متابعاتي","الشروط والاحكام","عن التطبيق","اتصل بنا","تسجيل الخروج"]
    
    @IBOutlet var sideMenuLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }


}
