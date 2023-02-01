//
//  Login.swift
//  PrayerApp
//
//  Created by Lyle Reinholz on 1/31/23.
//

import Foundation

// Model/Contract between API and Client
struct loginReponse: Codable {
    let userAuthenticated: Bool
    let token: String
}


struct LoginAPI {
    // This is to call the login API specifcally
    static func login(username: String, password: String, onSuccess: @escaping (loginReponse) -> (), onFailure: @escaping (String) -> ()) {
        guard let url = URL(string: "Endpoint") else { return }
        
        let parameters = [
            "username" : username,
            "password" : password
        ] as [String : Any]
                
        post(to: url, parameters: parameters, onSuccess: onSuccess, onFailure: onFailure)
    }
    
    // this is setup to be able to take any request and post it
    static func post<ResponseType: Decodable>(to url: URL, parameters: [String: Any], onSuccess: @escaping (ResponseType) -> (), onFailure: @escaping (String) -> ()) {
        guard let postData = (try? JSONSerialization.data(withJSONObject: parameters, options: [])) else { return }
        
        let request = URLRequest(url: url).with { request in
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = postData
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { onFailure(error.debugDescription)
                return
            } // will need more checks later like dealing with 400s or 500s
            guard let data = data else { onFailure("data error")
                return
            }
            
            guard let decodedResponse = try? JSONDecoder().decode(ResponseType.self, from: data) else { onFailure("decode issue")
                return
            }
            onSuccess(decodedResponse)
        }
    }
}

// ease of life protocol that allows me to take an object and set its own variables in a closure
extension URLRequest: With {}

public protocol With {}

extension With where Self: Any {
    @discardableResult public func with(_ block: (inout Self) throws -> Void) rethrows -> Self {
        var copy = self
        try block(&copy)
        return copy
    }
}
