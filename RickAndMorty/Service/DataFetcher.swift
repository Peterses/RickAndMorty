//
//  DataFetcher.swift
//  RickAndMorty
//
//  Created by Peterses on 17/03/2021.
//

import Foundation

//enum APIEndpoints {
//    case singleCharacter(id: Int)
//
//    var path: String {
//        switch self {
//        case let
//        case let .singleCharacter(id):
//            return "/get/news/\(id)"
//        }
//    }
//}

class DataFetcher {
    
    
    func fetchCharacterModels(page: Int, completion: @escaping (CharactersContainer?, Error?) -> Void) {
        let url = "https://rickandmortyapi.com/api/character?page=\(page)"
        
        genericGetFetcher(urlString: url) { completion($0, $1) }
    }
    
//    func fetchCharacterModels(completion: @escaping (CharactersContainer?, Error?) -> Void) {
//        let url = "https://rickandmortyapi.com/api/character"
//        
//        genericGetFetcher(urlString: url) { completion($0, $1) }
//    }
    
    func fetchCharacterModel(id: Int, completion: @escaping (CharacterModel?, Error?) -> Void) {
        let url = "https://rickandmortyapi.com/api/character/\(id)"
        
        genericGetFetcher(urlString: url) { completion($0, $1) }
    }
    
    private func genericGetFetcher<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, FetcherError.wrongURL)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let httpResponse = response as? HTTPURLResponse {
//                print(httpResponse.statusCode)
//            }
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, FetcherError.wrongData)
                return
            }

            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(model, nil)
            } catch let err {
                completion(nil, err)
            }
        }.resume()
    }
}

// MARK: - Error
extension DataFetcher {
    
    enum FetcherError: LocalizedError {
        case wrongURL
        case wrongData
        
        var errorDescription: String {
            switch self {
            case .wrongURL:
                return "wiadomość dla usera że coś poszło nie tak"
            case .wrongData:
                return "wiadomość dla usera że coś poszło nie tak"
            }
        }
    }
}
