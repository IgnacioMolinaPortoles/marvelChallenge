//
//  User.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 19/01/2021.
//

import Foundation

struct CharactersResponse: Decodable {
    
    let code: Int?
    let meta: Meta?
    let data: Data?
    
}

struct Data: Decodable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Character]?
}

struct Character: Decodable {
    
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics: Comics?
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case email
//        case gender
//        case status
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//    }
    
}

struct Comics: Decodable {
    
    let available: Int?
    let collectionURI: String?
    let items: [Comic]?
}

struct Comic: Decodable {
    
    let resourceURI: String?
    let name: String?
    
}

struct Thumbnail: Decodable {
    
    let path: String
    let `extension`: String
    
}
struct Meta: Decodable {
    
}

//{
//   "code":200,
//   "meta": null
//   },
//   "data":[
//      {
//         "id":6,
//         "name":"Mr. Anaadi Pillai",
//         "email":"pillai_anaadi_mr@beier.com",
//         "gender":"Female",
//         "status":"Inactive",
//         "created_at":"2021-01-27T03:50:04.227+05:30",
//         "updated_at":"2021-01-27T03:50:04.227+05:30"
//      }
//]
//}
