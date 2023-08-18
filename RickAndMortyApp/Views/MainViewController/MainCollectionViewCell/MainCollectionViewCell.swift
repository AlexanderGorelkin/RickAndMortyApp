//
//  MainCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 18.08.2023.
//

import UIKit
import Kingfisher

protocol ReusableCell: AnyObject {
    static var identifier: String { get }
}

class MainCollectionViewCell: UICollectionViewCell {
    
    
    private let characterImage: UIImageView = {
       let img = UIImageView()
        
        img.kf.setImage(with: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        img.layer.cornerRadius = 10
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private let nameLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "Rick Sanchez"
        lbl.textAlignment = .center
        lbl.textColor = R.Colors.whiteColor
        lbl.font = R.Fonts.gilroyFont(with: 17, weight: .thin)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layer.cornerRadius = 16
        backgroundColor = R.Colors.cellBackground
        
        
        addView(characterImage)
        addView(nameLabel)
        NSLayoutConstraint.activate([
        
        
            characterImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            characterImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterImage.heightAnchor.constraint(equalToConstant: 140),
            characterImage.widthAnchor.constraint(equalToConstant: 140),
            
            
            nameLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        
        
        
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    
    
}
extension MainCollectionViewCell: ReusableCell {
    static var identifier: String {
            return String(describing: self)
        }
}
