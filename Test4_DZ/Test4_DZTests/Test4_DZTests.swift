//
//  Test4_DZTests.swift
//  Test4_DZTests
//
//  Created by  Vladislav Bondarev on 31.05.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import XCTest
import Foundation
@testable import Test4_DZ

class Test4_DZTests: XCTestCase {

    private let service = Validate.shared
    
    private func randomEmail() -> String {
        let nameLength = Int.random(in: 2...20)
        let domainLength = Int.random(in: 1...15)
        let domainSuffixes = ["com", "net", "org", "io", "co.uk"]
        let name = randomText(length: nameLength)
        let domain = randomText(length: domainLength)
        let randomDomainSuffixIndex = Int(arc4random_uniform(UInt32(domainSuffixes.count)))
        let domainSuffix = domainSuffixes[randomDomainSuffixIndex]
        let text = name + "@" + domain + "." + domainSuffix
        return text
    }
    
    private func randomText(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyz0123456789-."
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    var correctLogin = [String]()
    var incorrectLogin = [String]()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        for _ in 1...20 {
            var email = randomEmail()
            if email.count > 32 || (email.first! >= Character("0") && email.first! <= Character("9")) || email.first! <= Character(".") || email.first! <= Character("-"){
                incorrectLogin.append(email)
            } else {
                correctLogin.append(email)
                email.insert("#", at: email.firstIndex(of: email.randomElement()!)!)
                incorrectLogin.append(email)
            }
        }
        for _ in 1...20 {
            let lenght = Int.random(in: 1...40)
            var nickname = randomText(length: lenght)
            if nickname.count > 32 || (nickname.first! >= Character("0") && nickname.first! <= Character("9")) || nickname.first! <= Character(".") || nickname.first! <= Character("-"){
                incorrectLogin.append(nickname)
            } else {
                correctLogin.append(nickname)
                if let index = nickname.lastIndex(of: ".") {
                    nickname.insert(Character("@"), at: nickname.index(after: index))
                } else {
                    nickname.insert("#", at: nickname.firstIndex(of: nickname.randomElement()!)!)
                }
                incorrectLogin.append(nickname)
            }
        }
        print(incorrectLogin)
        print( correctLogin)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidateSuccess() {
        for login in correctLogin {
            XCTAssertTrue(service.validate(login: login))
        }
    }
    func testValidateFailure() {
        for login in incorrectLogin {
            XCTAssertFalse(service.validate(login: login))
        }
    }
}
