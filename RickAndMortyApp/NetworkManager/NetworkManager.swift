//
//  NetworkManager.swift
//  RickAndMortyApp
//
//  Created by Александр Горелкин on 21.08.2023.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    
    func fetchAllCharacters(completion: @escaping(Result<Characters, Error>) -> Void) {
        request(route: .fetchAllCharacters, completion: completion)
    }
    func fetchAllEpisodes(completion: @escaping(Result<Characters, Error>) -> Void) {
        request(route: .fetchEpisode, completion: completion)
    }
    func fetchAllLocations(completion: @escaping(Result<Characters, Error>) -> Void) {
        request(route: .fetchLocation, completion: completion)
    }
    
    
    
    private func request<T: Codable>(route: Route, completion: @escaping(Result<T, Error>) -> Void) {
        
        guard let request = createRequest(route: route) else {
            completion(.failure("Something go wrong" as! Error))
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
            
            DispatchQueue.main.async {
                self.handleResponce(type: T.self, data: data, completion: completion)
            }
            
            
            
        }.resume()
        
    }
    private func handleResponce<T: Codable>(type: T.Type, data: Data, completion: (Result<T, Error>) -> Void) {
        
        guard let response = try? JSONDecoder().decode(type, from: data) else {
            print("Mistake")
            return
        }
        completion(.success(response))
        
        
    }
    
    
    
    private func createRequest(route: Route) -> URLRequest? {
        let url = Route.baseUrl + route.description
        guard let urlString = URL(string: url) else { return nil }
        var urlRequest = URLRequest(url: urlString)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "GET"
        print(urlRequest.url)
        return urlRequest
    }
    
}
