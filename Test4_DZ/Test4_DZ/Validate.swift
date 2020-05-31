//
//  Validate.swift
//  Test4_DZ
//
//  Created by  Vladislav Bondarev on 31.05.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation

class Validate {
    static let shared = Validate()
    
    private init() {}
    
    private let maxLenght = 32
    private let minLenght = 3
    private let emailPattern = "[a-z][0-9a-z.-]+\\@[0-9a-z.-]+\\.[0-9a-z]+"
    private let loginPattern = "[a-z][0-9a-z.-]+"
    
    func validate(login: String) -> Bool {
        guard login.count <= maxLenght && login.count >= minLenght else {
            return false
        }
        if login.contains("@") {
            return NSPredicate(format: "SELF MATCHES %@", emailPattern).evaluate(with: login.lowercased())
        } else {
            return NSPredicate(format: "SELF MATCHES %@", loginPattern).evaluate(with: login.lowercased())
        }
    }
}
