//
//  InfoView.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 18.08.2023.
//

import UIKit


final class InfoView: UIView {
    
    private lazy var infoLabel: UILabel = {
       let lbl = UILabel()
        
        return lbl
    }()
    
    
    private lazy var infoStackView: UIStackView = {
       let sv = UIStackView()
        
        
        return sv
    }()
    
    init(species: String, type: String, gender: String) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
