//
//  DetailViewController.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 18.08.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        scroll.backgroundColor = .cyan
        return scroll
    }()
    
    
    private lazy var personImageView: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .red
        return img
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        
        label.font = R.Fonts.gilroyFont(with: 22, weight: .bold)
        label.textColor = R.Colors.whiteColor
        label.text = "Rick Sanchez"
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
       let label = UILabel()
        label.text = "Alive"
        label.font = R.Fonts.gilroyFont(with: 16, weight: .bold)
        label.textColor = R.Colors.greenColor
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.Colors.backgroundColor
        setupViews()
        constraintViews()
    }
    
    
    
}
extension DetailViewController {
    func setupViews() {
        view.addView(scrollView)
        scrollView.addView(personImageView)
        scrollView.addView(nameLabel)
        scrollView.addView(statusLabel)
    }
    func constraintViews() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            personImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            personImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            personImageView.heightAnchor.constraint(equalToConstant: 148),
            personImageView.widthAnchor.constraint(equalToConstant: 148),
            
            
            nameLabel.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            statusLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            
        
        
        
        ])
    }
    
}
