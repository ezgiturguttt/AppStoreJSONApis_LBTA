//
//  AppGroup.swift
//  AppStoreJSONApisET
//
//  Created by Ezgı Mac on 16.05.2023.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable, Hashable {
    let id, name, artistName, artworkUrl100: String
}
