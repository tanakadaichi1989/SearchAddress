//
//  ZipcodeService.swift
//  SearchZIipcode
//
//  Created by 田中大地 on 2022/05/15.
//

import Foundation
import SwiftUI

class ZipcodeService {
    func fetch(_ zipCode: String,completion:@escaping (Zipcode) -> Void) {
        let urlString = "https://zipcloud.ibsnet.co.jp/api/search?zipcode=\(zipCode)"
        APIManager.fetch(urlString){ response in
            completion(response)
        }
    }
}
