//
//  ZipcodeService.swift
//  SearchZIipcode
//
//  Created by 田中大地 on 2022/05/15.
//

import Foundation
import SwiftUI

class ZipcodeService {
    
    func fetch(_ address: String,completion:@escaping (Zipcode) -> Void){
        var result: Data = Data()
        
        guard let url = URL(string: "https://zipcloud.ibsnet.co.jp/api/search?zipcode=\(address)") else { return }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let unwrappedData = data else { return }
            result = unwrappedData
            
            let decoder = JSONDecoder()
            guard let decodedResult = try? decoder.decode(Zipcode.self, from: result) else { return }
            completion(decodedResult)
        }
        
        task.resume()
    
    }
}
