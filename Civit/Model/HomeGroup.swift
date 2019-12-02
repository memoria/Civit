//
//  HomeGroup.swift
//  Civit
//
//  Created by Nishant Patel on 11/11/19.
//  Copyright © 2019 nishant. All rights reserved.
//

import Foundation

struct HomeGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

// Add articleLink here
struct FeedResult: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
    let articleLink: String
}
