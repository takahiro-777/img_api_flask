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

        Alamofire.request(baseURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseString { (response) in
                switch response.result {
                case .success(let v):
                    self.responseLabel.text = v
                case .failure(let error):
                    print(error)
                }
        }
    }

}

