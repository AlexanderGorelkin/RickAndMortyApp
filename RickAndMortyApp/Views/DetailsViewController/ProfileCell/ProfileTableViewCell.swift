//
//  ProfileTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 22.08.2023.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

class ProfileTableViewCell: UITableViewCell, ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
    
    private lazy var personImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "Frame")
        img.layer.cornerRadius = 16
        img.layer.masksToBounds = true
        return img
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = R.Fonts.gilroyFont(with: 22, weight: .bold)
        label.textColor = R.Colors.whiteColor
        label.text = "Hello"
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = R.Fonts.gilroyFont(with: 16, weight: .bold)
        label.textColor = R.Colors.greenColor
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = R.Colors.backgroundColor
        setupView()
        constraintViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension ProfileTableViewCell {
    func setupView() {
        addView(personImageView)
        addView(nameLabel)
        addView(statusLabel)
    }
    func constraintViews() {
        NSLayoutConstraint.activate([
        
            personImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            personImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            personImageView.heightAnchor.constraint(equalToConstant: 148),
            personImageView.widthAnchor.constraint(equalToConstant: 148),
            
            
            nameLabel.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        
    }
}

