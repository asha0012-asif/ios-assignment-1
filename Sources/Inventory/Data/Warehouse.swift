//
//  Warehouse.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-11.
//

import Foundation
import Hummingbird

struct Warehouse {
    let id: UUID
    let name: String
    let location: Location
    let contact: String
    let manager: String
    
    init(name: String, location: Location, contact: String, manager: String) {
        self.id = UUID()
        self.name = name
        self.location = location
        self.contact = contact
        self.manager = manager
    }
}

struct Location {
    let address: String
    let city: String
    let country: String
}

// Every data model you create MUST contain this line (DON'T forget to change the object name)
extension Warehouse: ResponseEncodable, Decodable, Equatable {}
extension Location: ResponseEncodable, Decodable, Equatable {}
