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
    
    func fetchGames(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/climateChange.json?alt=media&token=11a81f31-ec5f-4a9d-9148-fe186856eca6"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/policyRegulations.json?alt=media&token=fd204143-a957-43b9-905f-19ac231033c0"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchFreeApps(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/horizontalCellsData.json?alt=media&token=5ccabb62-d7b8-4cb2-bb47-57e225f7263c"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
//        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/header.json?alt=media&token=03e821a3-db88-4484-b921-e34a3423abdf"
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
