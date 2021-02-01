//
//  UserInformation.swift
//  Singleton
//
//  Created by 민성홍 on 2021/02/01.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var name: String?
    var age: String? 
}
