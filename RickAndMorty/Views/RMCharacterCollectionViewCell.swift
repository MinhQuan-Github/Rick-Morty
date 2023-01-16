//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Minh Quan on 16/01/2023.
//

import UIKit

final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let identifier = "RMCharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .secondarySystemBackground
        self.contentView.addSubviews(imageView, nameLabel, statusLabel)
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            self.statusLabel.heightAnchor.constraint(equalToConstant: 40),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            self.statusLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            self.statusLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
            self.nameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            self.nameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
            
            self.statusLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -3),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.statusLabel.topAnchor, constant: -3),
            
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.nameLabel.topAnchor, constant: -5),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.nameLabel.text = nil
        self.statusLabel.text = nil
    }
    
    public func configure(With viewModel: RMCharacterCollectionViewCellViewModel) {
        self.nameLabel.text = viewModel.characterName
        self.statusLabel.text = viewModel.CharacterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
