//
//  ZipcodeService.swift
//  SearchZIipcode
//
//  Created by 田中大地 on 2022/05/15.
//

import Foundation
import SwiftUI

class ZipcodeService {
    func fetch(_ zipCode: String,completion:@escaping (Zipcode?,Error?) -> Void) {
        let urlString = "https://zipcloud.ibsnet.co.jp/api/search?zipcode=\(zipCode)"
        do {
            try APIManager.fetch(urlString){ response, error in
                completion(response,nil)
            }
        } catch {
            completion(nil,error)
        }
    }
}
