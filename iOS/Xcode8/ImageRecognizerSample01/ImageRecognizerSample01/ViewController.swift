//
//  ViewController.swift
//  ImageRecognizerSample01
//
//  Created by 多鹿豊 on 2017/06/28.
//  Copyright © 2017年 Yutaka Tajika. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var responseLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        HttpClient.shared.get(apiPath: "/")?
            .success(callback: { (json) in
                self.responseLabel.text = json.string
            })
            .failure(callback: { (error) in
                print(error)
            })
    }

}

