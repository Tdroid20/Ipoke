//
//  PokeModel.swift
//  Ipoke
//
//  Created by user226765 on 9/27/22.
//

import Foundation;

struct PokeFetch: Codable {
    var count: Int = 0;
    var next: String? = "";
    var previous: String? = nil;
    var results: [PokeResultModel] = [];
}

struct PokeFetchManiplation: Codable {
    var name: String = "Name is Not Defined";
    var height: Int?;
    var baseExperience: Int?;
    var sprites: PokeSpritesContentModel?;
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case height = "height"
        case baseExperience = "base_experience"
        case sprites = "sprites"
    }
}

struct PokeResultModel: Codable {
    var name: String = "Name is Not Defined"
    var url: String = "URL is Not Defined"
}

struct PokeIndModel: Codable {
    var name: String = "Name is Not Defined"
    var url: String = "URL is Not Defined"
    var base_experience: Int = 0;
    var sprites: PokeSpritesContentModel?;
}

struct PokeSpritesContentModel: Codable {
    var backDefault: String?;
    var frontDefault: String?;
    private enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case frontDefault = "front_default"
    }
}
