//
//  ImageLoader.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import UIKit

final class ImageLoader {
    
    private var cache = [String: UIImage]()
    
    func image(urlString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let image = cache[urlString] {
            completion(.success(image))
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                self?.cache[urlString] = image
                completion(.success(image))
            } else {
                completion(.failure(NSError()))
            }
        }
        
        task.resume()
    }
}

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
