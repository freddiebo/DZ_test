//
//  ViewController.swift
//  Test4_DZ
//
//  Created by  Vladislav Bondarev on 31.05.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let serviceValidate = Validate.shared
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputText: UITextField!
    @IBAction func validateButton(_ sender: Any) {
        if serviceValidate.validate(login: inputText.text!){
            resultLabel.text = "Correct"
            resultLabel.textColor = .green
        } else {
            resultLabel.text = "Incorrect"
            resultLabel.textColor = .red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        // Do any additional setup after loading the view.
    }


}

