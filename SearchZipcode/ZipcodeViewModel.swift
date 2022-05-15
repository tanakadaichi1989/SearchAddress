//
//  ZipcodeViewModel.swift
//  SearchZIipcode
//
//  Created by 田中大地 on 2022/05/15.
//

import Foundation


class ZipcodeViewModel: ObservableObject {

    private let zipcodeService = ZipcodeService()

    func fetch(_ zipcode: String,completion:@escaping (Zipcode) -> Void){
        self.zipcodeService.fetch(zipcode) { response in
            completion(response)
        }
    }
}
