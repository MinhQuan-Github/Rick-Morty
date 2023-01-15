//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Minh Quan on 15/01/2023.
//

import UIKit

final class CharacterListView: UIView {
    
    private let viewModel = RMCharacterListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isHidden = true
        collectionView.alpha = 0
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(collectionView, spinner)
        self.addConstraints()
        self.spinner.startAnimating()
        self.viewModel.fetchCharacters()
        self.setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            self.spinner.widthAnchor.constraint(equalToConstant: 100),
            self.spinner.heightAnchor.constraint(equalToConstant: 100),
            self.spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            self.collectionView.topAnchor.constraint(equalTo: topAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            
        ])
    }
    
    private func setUpCollectionView() {
        self.collectionView.delegate = viewModel
        self.collectionView.dataSource = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.spinner.stopAnimating()
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        })
    }
}
