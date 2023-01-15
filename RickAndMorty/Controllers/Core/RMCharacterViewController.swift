//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Minh Quan on 13/01/2023.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    
    private let characterListView = CharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            self.characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            self.characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            self.characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
