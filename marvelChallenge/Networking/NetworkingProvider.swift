//
//  NetworkingProvider.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 19/01/2021.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    
    private let kApiKey = "&apikey=bec6defc8e5809ce1890ef88b9e7c8a9&hash=01ad0f186aa9c58eff493258258eb372&ts=thesoer"
    private let kBaseUrl = "https://gateway.marvel.com:443/v1/public/"
    private let kStatusOk = 200...299
    
    func getSuperheroes( pagination:Int, success: @escaping (_ character: [Character]) -> (), failure: @escaping (_ error: Error?) -> ()) {

        let url = "\(kBaseUrl)characters?limit=10&offset=\(pagination * 10)\(kApiKey)"
        print(url)
        AF.request("https://gateway.marvel.com:443/v1/public/characters?ts=thesoer&apikey=001ac6c73378bbfff488a36141458af2&hash=72e5ed53d1398abb831c3ceec263f18b", method: .get).validate(statusCode: kStatusOk).responseDecodable (of: CharactersResponse.self, decoder: DateDecoder()) {  response in
            if let character = response.value?.data?.results {
                success(character)
            } else {
                failure(response.error)
            }
        }
        
    }
}

