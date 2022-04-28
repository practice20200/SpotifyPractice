//
//  AuthManager.swift
//  SpotifyPractice
//
//  Created by Apple New on 2022-04-26.
//

import Foundation
final class AuthManger{
    static let shared = AuthManger()
    
    struct Constants {
        static let clientID = ""
        static let clientSecret = ""
    }
    
    private init() {}
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String?{
        return nil
    }
    
    private var refreshToken: String?{
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    
}

