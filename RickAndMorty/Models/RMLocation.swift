//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Minh Quan on 13/01/2023.
//

import Foundation


struct RMLocation: Codable {
    /**
     {
       "id": 3,
       "name": "Citadel of Ricks",
       "type": "Space station",
       "dimension": "unknown",
       "residents": [
         "https://rickandmortyapi.com/api/character/8",
         "https://rickandmortyapi.com/api/character/14",
         // ...
       ],
       "url": "https://rickandmortyapi.com/api/location/3",
       "created": "2017-11-10T13:08:13.191Z"
     }
     */
    
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
