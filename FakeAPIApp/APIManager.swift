//
//  APIManager.swift
//  FakeAPIApp
//
//  Created by Ahmet Ali ÇETİN on 24.03.2023.
//

import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler = (Result<[ProductModel], DataError> ) -> Void

final class APIManager {
    static let shared = APIManager()
    private init () {}
    
    func fetchDatas(completion: @escaping Handler) {
        guard let url = URL(string: Constants.API.productURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
          
            let jsonDecoder = JSONDecoder()
            
            do {
                let product = try jsonDecoder.decode([ProductModel].self, from: data)
                completion(.success(product))
            } catch {
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
    
}

//class A: APIManager {
//    override func temp() {
//
//    }
//
//    func configuration() {
//        let manager = APIManager()
//        manager.temp()
//
//        APIManager.shared.temp()
//    }
//}
