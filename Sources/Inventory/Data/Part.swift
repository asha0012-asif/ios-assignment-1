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
    let size: Dimensions?
    let weight: Double?
}

enum PartCategory: String {
    case engine
    case transmission
    case brakes
    case body
    case exterior
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
