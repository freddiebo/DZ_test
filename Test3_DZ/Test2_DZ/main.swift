//
//  main.swift
//  Test2_DZ
//
//  Created by  Vladislav Bondarev on 28.05.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import Foundation

func main() {
    let Network = ServerService()
    print("Enter user name from GitHub:")
    let input = readLine()
    guard let userName = input else {
        return
    }
    Network.getRepositories(for: userName, completion: { repositories in
        print("List of name repository:")
        for repository in repositories {
            if let name = repository["name"] as? String {
                print(name)
            }
        }
    })
    return
}
 
main()
while RunLoop.current.run(mode: .default, before: .distantFuture) { }
