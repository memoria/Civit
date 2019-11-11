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
    
    // Used in Search Tab
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> () ){
        print("Fetch iTunes apps from the service layer.")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        guard let url = URL(string: urlString) else { print("Nothing fetched"); return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch with the following error: >>> ", err)
                completion([], nil)
                return
            }
            
            guard let data = data else {return}
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch {
                print("Failed to decode JSON: ", error)
                completion([], error)
            }
        }.resume()
    }
    
    // Used in Apps tab
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> () ) {
        print("Fetch games for the Apps section")
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                appGroup.feed.results.forEach( {print($0.name)} )
                completion(appGroup, nil)
            } catch {
                print ("Failed to decode,", error)
                completion(nil, error)
            }
            
        }.resume()
    }
}
