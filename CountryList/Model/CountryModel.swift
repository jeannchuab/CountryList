//
//  CountryModel.swift
//  CountryList
//
//  Created by Jeann Luiz on 18/12/23.
//

import Foundation

struct CountryModel: Decodable, Identifiable {
    var id: UUID
    let name: Name
    let capital: [String]?
    let flags: Flags
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case capital
        case flags
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.name = try container.decode(Name.self, forKey: .name)
        self.capital = try? container.decode([String].self, forKey: .capital)
        self.flags = try container.decode(Flags.self, forKey: .flags)
    }
}

struct Name: Decodable {
    let common: String
    let official: String

    enum CodingKeys: String, CodingKey {
        case common
        case official
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        common = try container.decode(String.self, forKey: .common)
        official = try container.decode(String.self, forKey: .official)
    }
}

struct Flags: Decodable {
    let png: String
    let svg: String
}
