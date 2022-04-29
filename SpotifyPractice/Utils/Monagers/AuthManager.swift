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
        static let clientID = " "
        static let clientSecret = ""
    }
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURL = ""
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURL)&show_dialog=TRUE"
        
        return URL(string:string)
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
    
//    public func exchangeCodeForToken( code: String, completion: @escaping((Bool) -> Void)){
//        private
//    }
}

