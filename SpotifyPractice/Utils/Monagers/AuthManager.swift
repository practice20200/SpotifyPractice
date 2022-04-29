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
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
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
    
    public func exchangeCodeForToken( code: String, completion: @escaping((Bool) -> Void)){
        guard let url = URL(string: Constants.tokenAPIURL) else {
            return
        }
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: "auhorization_code"),
//            URLQueryItem(name: "grant_type", value: "authorization_code")
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("Fail to get base64")
            completion(false)
            return
        }
        
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(false)
                return
                
            }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                print("")
                
            }
            catch {
                print(error.localizedDescription)
                completion(false)
            }
        }
        task.resume()
    }
}

