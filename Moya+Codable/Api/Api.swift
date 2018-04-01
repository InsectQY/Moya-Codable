//
//  Api.swift
//  Moya+Codable
//
//  Created by QY on 2018/3/31.
//  Copyright © 2018年 QY. All rights reserved.
//

import Foundation
import Moya

private let TimeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<Api>.RequestResultClosure) -> Void in
    
    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 15
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

let ApiProvider = MoyaProvider<Api>(requestClosure: TimeoutClosure)

enum Api {
    
    case moive(String)
}

extension Api: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.douban.com")!
    }
    
    var path: String {
        switch self {
            
        case let .moive(id):
            return "v2/movie/subject/\(id)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
            
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
