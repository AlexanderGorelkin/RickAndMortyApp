//
//  OriginCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 22.08.2023.
//

import UIKit


final class OriginTableViewCell: UITableViewCell, ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
    private let originImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = R.Colors.backgroundColor
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = false
        img.image = UIImage(systemName: "pin")
        return img
    }()
    
    private let planetLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.whiteColor
        return label
    }()
    private let planetTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.greenColor
        return label
    }()
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 0
        sv.alignment = .fill
        sv.distribution = .fillEqually
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        constraintsView()
        self.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        layer.cornerRadius = 15
        layer.masksToBounds = false
        backgroundColor = R.Colors.cellBackground
    }
    
    func setup(name: String, planet: String) {
       
        planetLabel.text = name
        planetTypeLabel.text = planet
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension OriginTableViewCell {
    func setupViews() {
        addView(originImage)
        addView(stackView)
        
        stackView.addArrangedSubview(planetLabel)
        stackView.addArrangedSubview(planetTypeLabel)
    }
    func constraintsView() {
        NSLayoutConstraint.activate([
            

            
            originImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            originImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            originImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            originImage.heightAnchor.constraint(greaterThanOrEqualToConstant: 64),
            originImage.widthAnchor.constraint(equalToConstant: 64),
            
            
            stackView.leadingAnchor.constraint(equalTo: originImage.trailingAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
            
            
            
        ])
    }
}

