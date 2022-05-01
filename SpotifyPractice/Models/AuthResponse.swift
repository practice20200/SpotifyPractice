//
//  AuthResponse.swift
//  SpotifyPractice
//
//  Created by Apple New on 2022-05-01.
//

import Foundation
struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
//{
//    "access_token" = "";
//    "expires_in" = 3600;
//    "refresh_token" = "";
//    scope = "user-read-private";
//    "token_type" = "";
//}


