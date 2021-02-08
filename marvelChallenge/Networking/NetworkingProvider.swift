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
    
    private let kApiKey = "ts=thesoer&apikey=bec6defc8e5809ce1890ef88b9e7c8a9&hash=ab29605d13f833a1e7620265f9cd3145"
    private let kBaseUrl = "https://gateway.marvel.com:443/v1/public/"
    private let kStatusOk = 200...299
    
    func getSuperheroes( pagination:Int, success: @escaping (_ character: [_Character]) -> (), failure: @escaping (_ error: Error?) -> ()) {

        let url = "\(kBaseUrl)characters?limit=10&offset=\(pagination * 10)&\(kApiKey)"
        print(url)
        //Leer la api y agregar un offset para pedir mas

        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable (of: CharactersResponse.self, decoder: DateDecoder()) {  response in
            if let character = response.value?.data?.results {
                success(character)
            } else {
                failure(response.error)
            }
        }
        
    }
    
    func getEvents(pagination:Int, success: @escaping (_ events: [Event]) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        //let url = "\(kBaseUrl)events?\(kApiKey)"
        //Leer la api y agregar un offset para pedir mas
        AF.request("https://gateway.marvel.com:443/v1/public/events?ts=thesoer&apikey=bec6defc8e5809ce1890ef88b9e7c8a9&hash=ab29605d13f833a1e7620265f9cd3145", method: .get).validate(statusCode: kStatusOk).responseDecodable (of: EventResponse.self, decoder: DateDecoder()) {  response in
            if let events = response.value?.data?.results {
                success(events)
            } else {
                failure(response.error)
            }
        }
        
    }
}

