//
//  APICaller.swift
//  SpotifyPractice
//
//  Created by Apple New on 2022-04-26.
//

import Foundation
struct APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    enum APIError: Error {
        case failedToGetData
    }
    
    struct Constants{
        static let baseAPIURL = "https://api.spotify.com/v1"
    }
    
    public func getCurrentUserProfile(completion: @escaping(Result<UserProfile, Error>) -> Void){
        createRequest(with: URL(string: Constants.baseAPIURL + "/me"),type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _ , error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(UserProfile.self, from: data)
                    print(result)
                    completion(.success(result))
                }catch{
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func getNewReleases(completion:@escaping((Result<NewReleasesResponse, Error>)) -> Void){
        createRequest(with: URL(string: Constants.baseAPIURL + "/browse/new-releases?limit=50"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return }
                
                do{
                    let result = try JSONDecoder().decode(NewReleasesResponse.self, from: data)
//                    print(result)
                    completion(.success(result))
                }
                catch{
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func getFeaturedPlayLists(completion: @escaping((Result<FeaturedPlayListsResponse, Error>) -> Void)){
        createRequest(with: URL(string: Constants.baseAPIURL + "/browse/featured-playlists?limit=2"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return }
                
                do{
                    let result = try JSONDecoder().decode(FeaturedPlayListsResponse.self, from: data)
//                    print(result)
                    completion(.success(result))
                }
                catch{
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func getRecommendations(genres: Set<String>, completion: @escaping((Result<RecommendedGenresResponse, Error>) -> Void)){
        let seeds = genres.joined(separator: ",")
        createRequest(with: URL(string: Constants.baseAPIURL + "/recommendations?limit=50&seed_genres=\(seeds)"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return }
                
                do{
                    let result = try JSONDecoder().decode(RecommendedGenresResponse.self, from: data)
//                    print(result)
                    completion(.success(result))
                }
                catch{
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func getRecommendedGenres(completion: @escaping((Result<RecommendedGenresResponse, Error>) -> Void)){
           createRequest(with: URL(string: Constants.baseAPIURL + "/recommendations/available-genre-seeds"), type: .GET) { request in
               let task = URLSession.shared.dataTask(with: request) { data, _, error in
                   guard let data = data, error == nil else {
                       completion(.failure(APIError.failedToGetData))
                       return }
   
                   do{
                       let result = try JSONDecoder().decode(RecommendedGenresResponse.self, from: data)
   //                    print(result)
                       completion(.success(result))
                   }
                   catch{
                       completion(.failure(error))
                   }
               }
               task.resume()
           }
    }
    
    enum HTTPMethod: String{
        case GET
        case POST
    }
    
    private func createRequest(with url: URL?, type: HTTPMethod, completion:@escaping(URLRequest) -> Void){
        AuthManger.shared.withValidToken { token in
            guard let apiURL = url else {
                return
            }
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            completion(request)
        }
    }
    
}
