//
//  Addresses.swift
//  RandomNumber
//
//  Created by Aleksandar Drakaliyski on 30/10/2022.
//

import Foundation

struct Addresses: Codable {
    let addresses: [Address]
    
    static let allAddresses: [Addresses] = Bundle.main.decode(file: "addresses.json")
    static let sampleAddress: Addresses = allAddresses[0]
}

struct Address: Codable {
    let address1, address2: String
    let city: String?
    let state: States
    let postalCode: String
    let coordinates: Coordinates
}

struct Coordinates: Codable {
    let lat, lng: Double
}

enum States: String, Codable {
    case ak = "AK"
    case al = "AL"
    case ar = "AR"
    case az = "AZ"
    case ca = "CA"
    case co = "CO"
    case ct = "CT"
    case dc = "DC"
    case fl = "FL"
    case ga = "GA"
    case ky = "KY"
    case ma = "MA"
    case md = "MD"
    case ok = "OK"
    case tn = "TN"
    case vt = "VT"
}
