//
//  ViewController.swift
//  Test1_DZ
//
//  Created by  Vladislav Bondarev on 28.05.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let cellReuseIdentifier = "Cell"
    let baseUrl = "http://placehold.it/375x150?text="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 160
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let pathUrl = baseUrl + String(indexPath.row + 1)
        downloadImage(withURL: URL(string: pathUrl)!, forCell: cell)
        return cell
    }
    
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) {
            data, response, error in
            if let data = data {
                do {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imageView?.image = image
                    }
                } catch {
                    print("Error load from: \(url)")
                    return
                }
            }
            }
        task.resume()
    }
}

