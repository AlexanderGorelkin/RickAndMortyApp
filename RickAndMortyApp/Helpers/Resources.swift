//
//  Resources.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 18.08.2023.
//

import UIKit


enum R {
    enum Colors {
        static let backgroundColor = UIColor(hexString: "040C1E")
        static let whiteColor = UIColor(hexString: "FFFFFF")
        static let greenColor = UIColor(hexString: "47C60B")
        static let cellBackground = UIColor(hexString: "262A38")
    }
    enum Fonts {
        static func gilroyFont(with size: CGFloat, weight: FontWeight) -> UIFont {
            
            UIFont(name: "Gilroy-\(weight.rawValue)", size: size) ?? UIFont()
                }
    }
}
