//
//  Event.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 06/02/2021.
//

import Foundation

struct EventResponse: Decodable {
    let code: Int?
    let status: String?
    let etag: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Decodable {
    let offset, limit, total, count: Int?
    let results: [Event]?
}

// MARK: - Result
struct Event: Decodable {
    let id: Int?
    let title, resultDescription: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let modified: String?
    let start, end: Date?
    let thumbnail: Thumbnail?
    let creators: Creators?
    let characters: Characters?
    let stories: Stories?
    let comics, series: Characters?
    let next, previous: Next?

    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case resourceURI, urls, modified, start, end, thumbnail, creators, characters, stories, comics, series, next, previous
    }
}

// MARK: - Characters
struct Characters: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [Next]?
    let returned: Int?
}

// MARK: - Next
struct Next: Decodable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Creators
struct Creators: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [CreatorsItem]?
    let returned: Int?
}

// MARK: - CreatorsItem
struct CreatorsItem: Decodable {
    let resourceURI: String?
    let name: String?
    let role: Role?
}

enum Role: String, Decodable {
    case artist = "artist"
    case colorist = "colorist"
    case coloristCover = "colorist (cover)"
    case editor = "editor"
    case inker = "inker"
    case inkerCover = "inker (cover)"
    case letterer = "letterer"
    case other = "other"
    case penciler = "penciler"
    case pencilerCover = "penciler (cover)"
    case penciller = "penciller"
    case pencillerCover = "penciller (cover)"
    case roleColorist = "Colorist"
    case roleLetterer = "Letterer"
    case rolePenciller = "Penciller"
    case writer = "writer"
}

// MARK: - Stories
struct Stories: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
    let returned: Int?
}

// MARK: - StoriesItem
struct StoriesItem: Decodable {
    let resourceURI: String?
    let name: String?
    let type: ItemType?
}

enum ItemType: String, Decodable {
    case cover = "cover"
    case credits = "credits"
    case empty = ""
    case interiorStory = "interiorStory"
    case pinup = "pinup"
    case promo = "promo"
    case tableOfContents = "table of contents"
    case textArticle = "text article"
}


// MARK: - URLElement
struct URLElement: Decodable {
    let type: URLType?
    let url: String?
}

enum URLType: String, Codable {
    case detail = "detail"
    case wiki = "wiki"
}
