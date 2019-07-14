//
//  URLRequestBuilder.swift
//  IDEA_NetworkHandler
//
//  Created by Omar Adel on 7/14/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import Foundation
import Alamofire

protocol URLRequestBuilder : URLRequestConvertible {
    
    var mainURL : URL { get }
    
    var requestURL : URL { get }
    
    var path : String { get }
    
    var parameters : Parameters? { get }
    
    var method : HTTPMethod { get }

    var encoding : ParameterEncoding { get }
    
    var headers : HTTPHeaders { get }
    
    var urlRequest : URLRequest { get }

}


extension URLRequestBuilder {
    
    var encoding : ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var mainURL : URL {
        return URL(string: "https://www.google.com")!
    }
    
    var requestURL : URL {
        return mainURL.appendingPathComponent(path)
    }
    
    var urlRequest : URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        return request
    }
    
    var headers : HTTPHeaders {
        return [:]
    }
    
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}
