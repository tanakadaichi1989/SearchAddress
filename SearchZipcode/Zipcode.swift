//
//  Zipcode.swift
//  SearchZIipcode
//
//  Created by 田中大地 on 2022/05/14.
//

import Foundation

// MARK: - Welcome
struct Zipcode: Codable {
    let message: JSONNull?
    let results: [Result]
    let status: Int
}

// MARK: - Result
struct Result: Codable {
    let address1, address2, address3, kana1: String
    let kana2, kana3, prefcode, zipcode: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


// https://zipcloud.ibsnet.co.jp/api/search?zipcode=6620051
//
//{
//    "message": null,
//    "results": [
//        {
//            "address1": "兵庫県",
//            "address2": "西宮市",
//            "address3": "羽衣町",
//            "kana1": "ﾋｮｳｺﾞｹﾝ",
//            "kana2": "ﾆｼﾉﾐﾔｼ",
//            "kana3": "ﾊｺﾞﾛﾓﾁｮｳ",
//            "prefcode": "28",
//            "zipcode": "6620051"
//        }
//    ],
//    "status": 200
//}
