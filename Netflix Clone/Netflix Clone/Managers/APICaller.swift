//
//  APICaller.swift
//  Netflix Clone
//
//  Created by constantine Walker on 13.09.24.
//

import Foundation


struct Constants {
    static let API_KEY = "9396c5979ec83f23396993a38c15b545"
    static let baseURL = "https://api.themoviedb.org"
}


enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrandingMovies(completion: @escaping (Result<[Movie], Error>) -> ()){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch let error {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
    
}
