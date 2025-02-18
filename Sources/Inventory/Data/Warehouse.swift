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
    let contactNumber: String
    let manager: String
    
    init(id: UUID, name: String, location: Location, contactNumber: String, manager: String?) {
        self.id = id
        self.name = name
        self.location = location
        self.contactNumber = contactNumber
        self.manager = manager ?? "UNASSIGNED"
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
