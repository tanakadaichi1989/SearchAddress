//
//  ZipcodeViewModel.swift
//  SearchZIipcode
//
//  Created by 田中大地 on 2022/05/15.
//

import Foundation


class ZipcodeViewModel: ObservableObject {

    private let zipcodeService = ZipcodeService()

    func fetch(_ zipcode: String,completion:@escaping (Zipcode?,Error?) -> Void) {
        self.zipcodeService.fetch(zipcode) { response,error in
            DispatchQueue.global().async {
                if error != nil {
                    completion(nil,error)
                    return
                } else if response?.results[0] == nil {
                    completion(nil,ZipcodeViewModelError.resultIsNil)
                    return
                } else {
                    completion(response,nil)
                    return
                }
            }
        }
    }
    
    enum ZipcodeViewModelError: Error {
        case resultIsNil
    }
}
