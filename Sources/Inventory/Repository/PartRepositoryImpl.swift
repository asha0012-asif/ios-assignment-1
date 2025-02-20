//
//  PartRepositoryImpl.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-11.
//

import Foundation

struct PartRepositoryImpl {
    func create(name: String, category: PartCategory, size: Dimensions?, weight: Double?) async throws -> Part? {
        let id = UUID()
        let part = Part(id: id, name: name, category: category, size: size, weight: weight)
        
        Database.shared.add(element: part)
        return part
    }
    
    func get(id: UUID) async throws -> Part? {
        return Database.shared.listPart(id: id)
    }
    
    func list() async throws -> [Part] {
        return Database.shared.listAllParts()
    }
    
    func update(id: UUID, name: String, category: PartCategory, size: Dimensions?, weight: Double?) async throws -> Part? {
        let updatedPart = Part(id: id, name: name, category: category, size: size, weight: weight)
        return Database.shared.update(element: updatedPart)
    }
    
    func delete(id: UUID) async throws -> Bool {
        return Database.shared.deletePart(id: id)
    }
    
    func deleteAll() async throws -> Bool {
        return Database.shared.deleteAllParts()
    }
}

extension PartRepositoryImpl: PartRepository {}
