//
//  ServerService.swift
//  Test2_DZ
//
//  Created by  Vladislav Bondarev on 28.05.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//
import Foundation
import Alamofire

class ServerService {
    func getRepositories(for user: String, completion: @escaping (_ repositories: [[String:Any]]) -> Void) {
        let url = "https://api.github.com/users/\(user)/repos"
        AF.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let repositories = data as? [[String:Any]] else{
                    return
                }
                completion(repositories)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
