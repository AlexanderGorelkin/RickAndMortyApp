//
//  Route.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 21.08.2023.
//

import Foundation
enum Route {
    
    static let baseUrl = "https://rickandmortyapi.com/api"
    
    case fetchAllCharacters
    case fetchLocation
    case fetchEpisode
    
    var description: String {
        switch self {
        case .fetchAllCharacters:
            return "/character"
        case .fetchLocation:
            return "/location"
        case .fetchEpisode:
            return "/episode"
        }
    }
}
