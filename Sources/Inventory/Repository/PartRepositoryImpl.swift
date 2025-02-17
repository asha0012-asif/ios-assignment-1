//
//  PartRepositoryImpl.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-11.
//

import Foundation

struct PartRepositoryImpl {
    func create(name: String, category: PartCategory, size: Dimensions?, weight: Double?) async -> Part? {
        guard let size = size else {
            return nil
        }
        
        guard let weight = weight else {
            return nil
        }
        
        let part = Part(name: name, category: category, size: size, weight: weight)
        
        await Database.shared.addPart(part: part)
        
        return part
    }
    
    func get(id: UUID) async -> Part? {
        let foundPart = await Database.shared.listPart(id: id)
        return foundPart ?? nil
    }
    
    func list() async -> [Part] {
        let allParts = await Database.shared.listAllParts()
        return allParts
    }
    
    func update(id: UUID, name: String, category: PartCategory, size: Dimensions?, weight: Double?) async -> Part? {
        guard let size = size else {
            return nil
        }
        
        guard let weight = weight else {
            return nil
        }
        
        let updatedPart = Part(name: name, category: category, size: size, weight: weight)
        
        let result = await Database.shared.updatePart(id: id, updatedPart: updatedPart)
        return result
    }
    
    func delete(id: UUID) async -> Bool {
        let isPartDeleted = await Database.shared.deletePart(id: id)
        return isPartDeleted
    }
    
    func deleteAll() async -> Bool {
        let allPartsDeleted = await Database.shared.deleteAllParts()
        return allPartsDeleted
    }
}

extension PartRepositoryImpl: PartRepository {}
