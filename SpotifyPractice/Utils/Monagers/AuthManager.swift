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
        static let clientID = "23de831c20724d2fb8cc9c14c846d98a"
    static let clientSecret = "3e0a93ea05dc447b86067cfa0e55b9e8 "
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

