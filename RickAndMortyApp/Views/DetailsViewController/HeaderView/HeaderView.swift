//
//  HeaderView.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 23.08.2023.
//

import UIKit


final class HeaderView: UIView {
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.Fonts.gilroyFont(with: 17, weight: .bold)
        lbl.textColor = R.Colors.whiteColor
        lbl.textAlignment = .left
        return lbl
    }()
    
    init(text: String) {
        super.init(frame: .zero)
        addView(titleLabel)
        titleLabel.text = text
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
