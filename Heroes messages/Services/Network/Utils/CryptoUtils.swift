//
//  CryptoUtils.swift
//  Heroes messages
//
//  Created by Кирилл on 15.05.2022.
//

import Foundation
import CryptoKit

extension String {
    
    var MD5: String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}

extension Dictionary where Key == String, Value == String {
    
    func extractImage() -> String {
        let path = self["path"] ?? ""
        let ext = self["extension"] ?? ""
        
        return "\(path).\(ext)"
    }
}
