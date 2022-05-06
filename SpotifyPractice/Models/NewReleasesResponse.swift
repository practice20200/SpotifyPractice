

import Foundation

struct NewReleasesResponse: Codable {
    let albums: AlbumResponse
}

struct AlbumResponse : Codable{
    let items: [Album]
}

struct Album: Codable{
    let album_type: String
    let available_markets: [String]
    let id: String
    let images: [UserImage]
    let name: String
    let release_tracks: Int
    let artist: [Artist]
}

