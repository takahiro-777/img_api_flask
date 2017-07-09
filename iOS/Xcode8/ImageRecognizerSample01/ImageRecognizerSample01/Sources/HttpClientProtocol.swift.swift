//
//  HttpClientProtocol.swift.swift
//  ImageRecognizerSample01
//
//  Created by 多鹿豊 on 2017/07/09.
//  Copyright © 2017年 Yutaka Tajika. All rights reserved.
//

import Foundation
import Alamofire

protocol HttpClientProtocol {
    static var shared: HttpClientProtocol { get }
    /// HTTPクライアントのマネージャー。低レイヤーのカスタマイズを行う際はこちらを使用する
    var manager: HttpSessionManager { get }
    /// request(apiPath: ...)メソッドのAPIエンドポイントのベースとなるパス
    var urlBase: String { get set }
    var encoding: ParameterEncoding { get set }
    init()
    init(urlBase: String?, encoding: ParameterEncoding?, headers: HttpHeaders?)
}

extension HttpClientProtocol {
    
    //======================
    //
    // MARK: - Life Cycle
    //
    //======================
    
    init(urlBase: String? = nil, encoding: ParameterEncoding? = nil, headers: HttpHeaders? = nil) {
        self.init()
        if let urlBase = urlBase {
            self.urlBase = urlBase
        }
        if let encoding = encoding {
            self.encoding = encoding
        }
        if let headers = headers {
            manager.session.configuration.httpAdditionalHeaders = headers
        } else {
            manager.session.configuration.httpAdditionalHeaders = [
                "Accept": "application/json"
            ]
        }
    }
    
    //======================
    //
    // MARK: - Methods
    //
    //======================
    
    @discardableResult
    func request(fullURL url: String, method: HttpMethod, parameters: HttpParameters = [:], reAuth: Bool = true) -> DataRequest? {
        return manager.request(url, method: method, parameters: parameters, encoding: self.encoding)
    }
    
    @discardableResult
    func request(apiPath path: String, method: HttpMethod, parameters: HttpParameters = [:], reAuth: Bool = true) -> DataRequest? {
        let url = "\(self.urlBase)\(path)"
        return self.request(fullURL: url, method: method, parameters: parameters, reAuth: reAuth)
    }
    
    @discardableResult
    func get(apiPath path: String, parameters: HttpParameters = [:], reAuth: Bool = true) -> DataRequest? {
        return request(apiPath: path, method: .get, parameters: parameters, reAuth: reAuth)
    }
    
    @discardableResult
    func post(apiPath path: String, parameters: HttpParameters = [:], reAuth: Bool = true) -> DataRequest? {
        return request(apiPath: path, method: .post, parameters: parameters, reAuth: reAuth)
    }
    
    @discardableResult
    func upload(apiPath path: String, fileURL url: URL, method: HttpMethod) -> UploadRequest {
        return manager.upload(url, to: path, method: method, headers: nil)
    }
    
    
}
