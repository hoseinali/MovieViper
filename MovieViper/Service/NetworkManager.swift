//
//  Network.swift
//  MovieViper
//
//  Created by hossein on 9/28/1401 AP.
//


import Foundation
import Alamofire

enum Results<T> {
    case success(T)
    case failure(Error)
}

class NetworkManager {
    
    static let shared: NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()

    func request<T: Codable>(_ request: URLRequestConvertible, decodeToType type: T.Type, completionHandler: @escaping (Results<T>) -> ()) {
        AF.request(request).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(decoded))
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}

enum Router: URLRequestConvertible {
    
    case movies
    
    var method: HTTPMethod {
        switch self {
        case .movies:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .movies:
            return nil
        }
    }
    
    var url: URL {
        switch self {
        case .movies:
            let url = URL(string: Constants.BaseURL.moviesURL)!
            return url
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}

