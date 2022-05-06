//
//  FeaturedPlayListsResponse.swift
//  SpotifyPractice
//
//  Created by Apple New on 2022-05-05.
//

import Foundation
struct FeaturedPlayListsResponse: Codable{
    let playlists: playListResponse
}


struct playListResponse: Codable{
    let items: [Playlist]
}



struct User: Codable{
    let display_name: String
    let external_urls: [String: String]
    let id: String
}
