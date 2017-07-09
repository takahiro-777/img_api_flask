//
//  HttpClient.swift
//  ImageRecognizerSample01
//
//  Created by 多鹿豊 on 2017/07/09.
//  Copyright © 2017年 Yutaka Tajika. All rights reserved.
//

import Foundation

class HttpClient: HttpClientProtocol {
    
    static let shared: HttpClientProtocol = HttpClient()
    
    //======================
    //
    // MARK: - Properties
    //
    //======================
    
    var manager = HttpSessionManager.default
    var urlBase: String = baseURL
    var encoding: ParameterEncoding = URLEncoding.default
    
    
    //======================
    //
    // MARK: - Initializer
    //
    //======================
    
    required init() {}
    
}
