//
//  EpisodeCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 22.08.2023.
//

import UIKit


final class EpisodeTableViewCell: UITableViewCell, ReusableView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    private let episodeName: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.gilroyFont(with: 17, weight: .bold)
        label.textColor = R.Colors.whiteColor
        label.text = "Episode label"
        return label
    }()
    
    private let episodeLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.gilroyFont(with: 13, weight: .medium)
        label.textColor = R.Colors.greenColor
        label.text = "Episode label"
        label.textAlignment = .left
        return label
    }()
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.gilroyFont(with: 13, weight: .light)
        label.textColor = .systemGray
        label.textAlignment = .right
        label.text = "Episode label"
        return label
    }()
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 0
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layer.cornerRadius = 15
        layer.masksToBounds = false
        backgroundColor = R.Colors.cellBackground
        setupViews()
        constraintsView()
    }
    
    func setup(name: String, episode: String, date: String) {
        episodeName.text = name
        episodeLabel.text = episode
        dateLabel.text = date
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension EpisodeTableViewCell {
    func setupViews() {
        addView(episodeName)
        addView(stackView)
        stackView.addArrangedSubview(episodeLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    func constraintsView() {
        NSLayoutConstraint.activate([
            
            episodeName.topAnchor.constraint(equalTo: topAnchor, constant: 15.25),
            episodeName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.25),
            episodeName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.25),
            
            stackView.topAnchor.constraint(equalTo: episodeName.bottomAnchor, constant: 15.25),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.25),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.25),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15.25),
            
            
            
            
        ])
    }
}


