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
    
    // Change to Generics later
    func fetchGames(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json"
        fetchHomeGroup(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing-ipad/all/25/explicit.json"
        fetchHomeGroup(urlString: urlString, completion: completion)
    }
    
    func fetchFreeApps(completion: @escaping (HomeGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json"
        fetchHomeGroup(urlString: urlString, completion: completion)
    }
    
    // Mark: Fetch multiple categories of data
    func fetchHomeGroup(urlString: String, completion: @escaping (HomeGroup?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            do {
                let homeGroup = try JSONDecoder().decode(HomeGroup.self, from: data!)
                homeGroup.feed.results.forEach( {print($0.name)} )
                completion(homeGroup, nil)
            } catch {
                completion(nil, error)
                print("Failed to decode, ", error)
            }
        }.resume()
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            do {
                let objects = try JSONDecoder().decode([SocialApp].self, from: data!)
                completion(objects, nil)
            } catch {
                completion(nil, error)
                print("Failed to decode, ", error)
            }
        }.resume()
    }
}
