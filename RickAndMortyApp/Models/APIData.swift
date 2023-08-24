//
//  APIData.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 21.08.2023.
//

import Foundation


struct ApiData<T: Codable>: Codable {
    var results: [T]
}
