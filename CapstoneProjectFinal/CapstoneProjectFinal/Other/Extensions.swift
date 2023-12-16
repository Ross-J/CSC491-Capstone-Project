//
//  Extensions.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/14/23.
//

import Foundation

// extension to encode codable data object to a dictionary
extension Encodable {
    
    func asDictionary() -> [String: Any] {
        // try to retrieve data from current codable object and encode to dictionary format
        // if failed, return empty dictionary
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        // if successful, try to convert data retrieved to json and cast as a string:any dictionary
        // if failed, return empty dictionary
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
