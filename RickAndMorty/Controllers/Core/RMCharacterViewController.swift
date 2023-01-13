//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Minh Quan on 13/01/2023.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "statuc", value: "alive")
            ]
        )
        print(request.url as Any)
        
        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
            
        }
    }
}
