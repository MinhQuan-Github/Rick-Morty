//
//  RMService.swift
//  RickAndMorty
//
//  Created by Minh Quan on 13/01/2023.
//

import UIKit


final class RMService {
    static let shared = RMService()
    
    private init() {}
    
    enum RMSeviceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMSeviceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _ , error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMSeviceError.failedToGetData))
                return
            }
            
            do {
//                let json = try JSONSerialization.jsonObject(with: data)
//                print(json)
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
