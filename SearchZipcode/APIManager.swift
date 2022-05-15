//
//  APIManager.swift
//  SearchZipcode
//
//  Created by 田中大地 on 2022/05/15.
//

import Foundation

class APIManager {
    static func fetch<T: Decodable>(_ urlString: String,completion:@escaping (T) -> Void){
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let unwrappedData = data else { return }
            let decoder = JSONDecoder()
            guard let decodedResult = try? decoder.decode(T.self, from: unwrappedData) else { return }
            completion(decodedResult)
        }
        task.resume()
    }
}
