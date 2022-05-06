
import Foundation
struct AudioTrack: Codable{
    let album: Album
    let artist: [Artist]
    let available_market: [String]
    let disc_number: Int
    let duration_ms: Int
    let explicit: Bool
    let external_urls: [String:String]
    let id: String
    let name: String
    let popularity: Int
}
