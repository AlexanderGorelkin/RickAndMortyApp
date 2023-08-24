//
//  InfoView.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 22.08.2023.
//

import UIKit

enum InfoValue: String, CaseIterable {
    case species = "Species:"
    case type = "Type:"
    case gender = "Gender:"
}


final class InfoTableViewCell: UITableViewCell, ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
    
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 15
        stackView.axis = .vertical
        return stackView
    }()
    
    
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = R.Colors.cellBackground
        layer.cornerRadius = 16
        layer.masksToBounds = true
        addView(verticalStackView)
        verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
    }
    
    func setup(params: [String]) {
        
        for i in 0..<params.count {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.distribution = .fillEqually
            let titleLabel = UILabel()
            titleLabel.font = R.Fonts.gilroyFont(with: 16, weight: .medium)
            titleLabel.textColor = R.Colors.whiteColor
            titleLabel.textAlignment = .left
            titleLabel.text = InfoValue.allCases[i].rawValue
            let descriptionLabel = UILabel()
            descriptionLabel.font = R.Fonts.gilroyFont(with: 16, weight: .medium)
            descriptionLabel.textColor = R.Colors.whiteColor
            descriptionLabel.textAlignment = .right
            descriptionLabel.text = params[i].isEmpty ? "None" : params[i]
            
            stackView.addArrangedSubview(titleLabel)
            stackView.addArrangedSubview(descriptionLabel)
            self.verticalStackView.addArrangedSubview(stackView)
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
}
