//
//  RegisterResponse.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/22/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//
import Foundation

// MARK: - Welcome
struct EmailVerificationResponse: Codable {
    let errorMessage : String?
    let data: EmailVerificationDataClass?
}

// MARK: - DataClass
struct EmailVerificationDataClass :Codable{
    let id: Int?
    let isVerified, token: String?
}
