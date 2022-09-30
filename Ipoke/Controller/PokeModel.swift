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

struct PokeResultModel: Codable {
    var name: String = "Name is Not Defined"
    var url: String = "URL is Not Defined"
}

struct PokeIndModel: Codable {
    var name: String = "Name is Not Defined"
    var base_experience: Int = 0;
    var sprites: Sprite = Sprite();
    var species: PokeSpecies = PokeSpecies();
    var stats: [PokeStats] = [];
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case base_experience = "base_experience"
        case sprites = "sprites"
        case species = "species"
        case stats = "stats"
    }
}

struct Sprite: Codable {
    var front_default:String = ""
    var other: OfficialArtWork = OfficialArtWork()
    
}


struct OfficialArtWork: Codable {
    var artWork: FrontDefault = FrontDefault()
    private enum CodingKeys: String, CodingKey {
        case artWork = "official-artwork"
    }
}

struct FrontDefault: Codable {
    var front_default: String = ""
}

struct PokeSpecies: Codable {
    var name: String = "Specie unique"
    var url: String = "URL Species is not defined"
}

struct PokeStats: Codable {
    var base_stat: Int = 0;
    var effort: Int = 0;
    var stat: PokeStatInd?;
    private enum CodeKeys: String, CodingKey {
        case base_stat = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }
}

struct PokeStatInd: Codable {
    var name: String = "Stat Name is Not Defined"
    var url: String = "URL Stat is Not Defined"
}

struct PokeSpritesContentModel: Codable {
    var backDefault: String?;
    var frontDefault: String?;
    private enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case frontDefault = "front_default"
    }
}
