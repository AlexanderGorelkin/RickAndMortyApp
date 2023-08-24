//
//  Location.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 21.08.2023.
//

import Foundation

struct Location: Codable {
    var id: Int?
    var name: String
    var type: String
    var dimension: String?
    var residents: [String]?
    var url: String?
    var created: String?
    
    var shortName: String {
        return name.components(separatedBy: " ")[0]
    }
}
