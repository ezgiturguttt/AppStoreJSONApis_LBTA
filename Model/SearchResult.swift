//
//  SearchResult.swift
//  AppStoreJSONApisET
//
//  Created by Ezgı Mac on 9.05.2023.
//

import Foundation

struct SearchResult : Decodable {
    let resultCount : Int
    let results : [Result]
}

struct Result : Decodable {
    var trackId: Int
    var trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    var screenshotUrls: [String]?
    let artworkUrl100: String // app icon
    // http://itunes.apple.com/lookup?id= idsini gir asagidaki iki veri gelir;
    var formattedPrice: String?
    var description: String?
    var releaseNotes: String?
    var artistName: String?
    var collectionName: String?
}
