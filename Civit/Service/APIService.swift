//
//  APIService.swift
//  appstore
//
//  Created by Nishant Patel on 9/30/19.
//  Copyright © 2019 nish. All rights reserved.
//

import Foundation

class APIService {
    static let shared = APIService() // singleton
    
    // Air Pollution
    func fetchGames(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/airPollution.json?alt=media&token=590af7d4-3af7-41b0-b396-6f8e6e82e307"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // Biodiversity Loss
    func fetchTopGrossing(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/bioDRealREAL.json?alt=media&token=334b4764-9945-4938-b981-519dc87a3fca"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // Policy & Reg
    func fetchFreeApps(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/policy.json?alt=media&token=52015a74-fe86-4789-8ae6-750ab218101d"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // Policy & Reg
    func fetchClimateChange(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/climateChangeReal.json?alt=media&token=61fed177-e049-468c-9f84-b2d53460ac78"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // Header Cells
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
//        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/header.json?alt=media&token=03e821a3-db88-4484-b921-e34a3423abdf"
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/headerRealData.json?alt=media&token=61187a08-d41b-4222-9b02-a3b1eb2a71cd"
       fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // Generic to encapsulate all cases of above
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                completion(objects, nil)
            } catch {
                completion(nil, error)
                print("Failed to decode, ", error)
            }
        }.resume()
    }
    
}
