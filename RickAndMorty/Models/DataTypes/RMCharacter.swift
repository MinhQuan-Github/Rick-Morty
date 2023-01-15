//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Minh Quan on 13/01/2023.
//

import UIKit

class RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}


