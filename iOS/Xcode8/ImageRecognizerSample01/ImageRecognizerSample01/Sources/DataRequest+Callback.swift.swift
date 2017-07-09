//
//  DataRequest+Callback.swift.swift
//  ImageRecognizerSample01
//
//  Created by 多鹿豊 on 2017/07/09.
//  Copyright © 2017年 Yutaka Tajika. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension DataRequest {
    
    /**
     成功時のコールバック
     */
    @discardableResult
    func success(callback: @escaping Success) -> Self {
        return responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                callback(json)
            case .failure(_):
                break
            }
        }
    }
    
    /**
     失敗時のコールバック
     */
    @discardableResult
    func failure(callback: @escaping Failure) -> Self {
        return responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(_):
                break
            case .failure(let error):
                callback(error)
            }
        })
    }
    
    /**
     成功・失敗に関わらず、responseが返ってきたら実行する処理
     */
    @discardableResult
    func always(callback: @escaping Always) -> Self {
        return responseJSON(completionHandler: { (response) in
            callback(response)
        })
    }
}
