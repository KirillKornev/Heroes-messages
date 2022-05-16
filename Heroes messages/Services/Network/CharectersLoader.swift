//
//  CharectersLoader.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

final class CharectersLoader {
    
    func loadCharacters(completion: @escaping ([Character]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let apiResult = try? JSONDecoder().decode(MarvelApiModel.self, from: data)
                completion(apiResult?.data.results ?? [])
            } else if let error = error {
                print("HTTP error \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    // MARK: - Private
    
    private var urlString: String {
        let ts = String(Date().timeIntervalSince1970)
        let key: String = "\(ts)\(MarvelAPIKeys.privateKey)\(MarvelAPIKeys.publicKey)"
        let hash = key.MD5
        let url = "https://gateway.marvel.com:443/v1/public/characters?ts=\(ts)&apikey=\(MarvelAPIKeys.publicKey)&hash=\(hash)"
        
        return url
    }
}
