//
//  Zipcode.swift
//  SearchZIipcode
//
//  Created by 田中大地 on 2022/05/14.
//

import Foundation

// MARK: - Welcome
struct Zipcode: Codable {
    let message: Message?
    let results: [Result]
    let status: Int
}

// MARK: - Result
struct Result: Codable {
    let address1, address2, address3, kana1, kana2, kana3, prefcode, zipcode: String
}

// MARK: - Encode/decode helpers

class Message: Codable, Hashable {

    public static func == (lhs: Message, rhs: Message) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(Message.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
