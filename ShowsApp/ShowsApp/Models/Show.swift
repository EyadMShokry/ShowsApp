//
//  Show.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 24/12/2021.
//

import Foundation

// MARK: - Show
struct Show: Decodable {
    let score: Double?
    let show: ShowClass?
}

// MARK: - ShowClass
struct ShowClass: Decodable {
    let id: Int?
    let url: String?
    let name: String?
    let type: String?
    let language: String?
    let genres: [String]?
    let status: String?
    let runtime: Int?
    let averageRuntime: Int?
    let premiered, ended: String?
    let officialSite: String?
    let schedule: Schedule?
    let rating: Rating?
    let weight: Int?
    let network, webChannel: Network?
    let dvdCountry: String?
    let externals: Externals
    let image: Image?
    let summary: String?
    let updated: Int?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id, url, name, type, language, genres, status, runtime, averageRuntime, premiered, ended, officialSite, schedule, rating, weight, network, webChannel, dvdCountry, externals, image, summary, updated
        case links = "_links"
    }
}

// MARK: - Externals
struct Externals: Decodable {
    let tvrage, thetvdb: Int?
    let imdb: String?
}

// MARK: - Image
struct Image: Decodable {
    let medium, original: String?
}


// MARK: - Links
struct Links: Decodable {
    let linksSelf, previousepisode: Previousepisode?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case previousepisode
    }
}

// MARK: - Previousepisode
struct Previousepisode: Decodable {
    let href: String
}

// MARK: - Network
struct Network: Decodable {
    let id: Int?
    let name: String?
    let country: Country?
}

// MARK: - Country
struct Country: Decodable {
    let name, code, timezone: String?
}

// MARK: - Rating
struct Rating: Decodable {
    let average: Double?
}

// MARK: - Schedule
struct Schedule: Decodable {
    let time: String?
    let days: [String]?
}


