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
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/bioDLossReal.json?alt=media&token=07fd9f15-2d74-475f-9cd3-5e44d032e724"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // Biodiversity Loss
    func fetchTopGrossing(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/bioDRealREAL.json?alt=media&token=de0fbec7-9c8c-49ee-8534-8329aa9c5101"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // Policy & Reg
    func fetchFreeApps(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/civit-d72ba.appspot.com/o/horizontalCellsData.json?alt=media&token=5ccabb62-d7b8-4cb2-bb47-57e225f7263c"
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
