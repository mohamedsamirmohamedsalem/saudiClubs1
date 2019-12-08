//
//  RegisterResponse.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/22/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//
import Foundation

// MARK: - Welcome
struct RegisterResponse: Codable{
    let message: String?
    let errors: SignUpErrors?
}

// MARK: - Errors
struct SignUpErrors:Codable{
    let email, phone: [String]?
}
