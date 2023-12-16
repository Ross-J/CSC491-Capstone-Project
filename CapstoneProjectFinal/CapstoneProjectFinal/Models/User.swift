//
//  User.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import Foundation

// definining the parameters of a user
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
