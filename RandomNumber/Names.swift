//
//  Boys.swift
//  RandomNumber
//
//  Created by Aleksandar Drakaliyski on 30/09/2022.
//

import Foundation

struct Names: Codable, Hashable {
    let girls, boys: [String]
    
    static let allNames: [Names] = Bundle.main.decode(file: "names.json")
    static let example: Names = allNames[0]
}
