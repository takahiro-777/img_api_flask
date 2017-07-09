//
//  HttpTypeAliases.swift.swift
//  ImageRecognizerSample01
//
//  Created by 多鹿豊 on 2017/07/09.
//  Copyright © 2017年 Yutaka Tajika. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias DataResponse = Alamofire.DataResponse
typealias DataRequest = Alamofire.DataRequest
typealias HttpSessionManager = Alamofire.SessionManager
typealias HttpHeaders = Alamofire.HTTPHeaders
typealias ParameterEncoding = Alamofire.ParameterEncoding
typealias URLEncoding = Alamofire.URLEncoding
typealias HttpMethod = Alamofire.HTTPMethod
typealias HttpParameters = Alamofire.Parameters
typealias UploadRequest = Alamofire.UploadRequest

typealias Success = (JSON) -> ()
typealias Failure = (Error) -> ()
typealias Always = (DataResponse<Any>) -> ()
