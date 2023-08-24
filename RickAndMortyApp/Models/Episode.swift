//
//  Episode.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 22.08.2023.
//

import Foundation

struct Episode: Codable{
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    
}
