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


struct Playlist: Codable{
    let description: String
    let external_urls: [String: String]
    let id : String
    let images: [UserImage]
    let name: String
    let owner: User
}

struct User: Codable{
    let display_name: String
    let external_urls: [String: String]
    let id: String
}
