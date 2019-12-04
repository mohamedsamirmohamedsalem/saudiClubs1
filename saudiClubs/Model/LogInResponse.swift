//
//  LogInResponse.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/3/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import Foundation

struct LogInResponse : Codable {
      let data: DataClass?
}
    // MARK: - DataClass
struct DataClass : Codable{
        let id : Int?
        let isVerified: Int?
        let token: String?
    }
