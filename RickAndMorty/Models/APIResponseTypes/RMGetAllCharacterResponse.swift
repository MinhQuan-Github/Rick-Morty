//
//  RMGetAllCharacterResponse.swift
//  RickAndMorty
//
//  Created by Minh Quan on 15/01/2023.
//

import Foundation


struct RMGetAllCharactersResonse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
