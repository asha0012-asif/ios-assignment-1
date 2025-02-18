//
//  Part.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-11.
//

import Foundation
import Hummingbird

struct Part {
    let id: UUID
    let name: String
    let category: PartCategory
    let size: Dimensions
    let weight: Double
    
    init(id: UUID, name: String, category: PartCategory, size: Dimensions, weight: Double) {
        self.id = id
        self.name = name
        self.category = category
        self.size = size
        self.weight = weight
    }
}

enum PartCategory {
    case engine
    case transmission
    case brakes
    case body
}

struct Dimensions {
    let height: Double
    let width: Double
    let length: Double
}

// Every data model you create MUST contain this line (DON'T forget to change the object name)
extension Part: ResponseEncodable, Decodable, Equatable {}
extension PartCategory: ResponseEncodable, Decodable, Equatable {}
extension Dimensions: ResponseEncodable, Decodable, Equatable {}
