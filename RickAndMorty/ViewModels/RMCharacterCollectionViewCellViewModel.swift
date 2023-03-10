//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Minh Quan on 16/01/2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel: NSObject {
    
    public let characterName: String
    public let characterStatus: RMCharacterStatus
    public let characterImageUrl: URL?
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var CharacterStatusText: String {
        return characterStatus.rawValue
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = self.characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
