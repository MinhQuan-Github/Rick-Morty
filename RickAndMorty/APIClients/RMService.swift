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
    
    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
