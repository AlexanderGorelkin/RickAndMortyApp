//
//  InfoView.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 22.08.2023.
//

import UIKit

enum Info: String {
    case species = "Species:"
    case type = "Type:"
    case gender = "Gender:"
}


final class InfoView: UIView {
    
    private let verticalStackView: UIStackView = {
       let stackView = UIStackView()
        
        stackView.axis = .vertical
        return stackView
    }()
    
    private let horizontalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 0
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        return sv
    }()
    let titleLabel: UILabel = {
       let lbl = UILabel()
        lbl.font = R.Fonts.gilroyFont(with: 16, weight: .medium)
        lbl.textColor = UIColor.systemGray
        lbl.textAlignment = .left
        
        
        return lbl
    }()
    let nameLabel: UILabel = {
       let lbl = UILabel()
        lbl.font = R.Fonts.gilroyFont(with: 16, weight: .medium)
        lbl.textColor = R.Colors.whiteColor
        lbl.textAlignment = .right
        return lbl
    }()
    
    
    
    
    init(tuple: (species: String, type: String, gender: String)) {
        super.init(frame: .zero)
        addView(verticalStackView)
        verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
}
