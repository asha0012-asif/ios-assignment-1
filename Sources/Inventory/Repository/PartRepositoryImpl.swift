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
        let allParts = await Database.shared.listAllParts()
        
        let foundPart = allParts.filter { $0.id == id }.first
        return foundPart
    }
    
    func list() async -> [Part] {
        let allParts = await Database.shared.listAllParts()
        return allParts
    }
    
    func update(id: UUID, name: String, category: PartCategory, size: Dimensions?, weight: Double?) async -> Part? {
        #warning("Implement update logic here")
    }
    
    func delete(id: UUID) async -> Bool {
        let allParts = await Database.shared.listAllParts()
        let foundPart = allParts.filter { $0.id == id }.first
        
        await Database.shared.deletePart(id: id)
        
        return true
    }
    
    func deleteAll() async -> Bool {
        await Database.shared.deleteAllParts()
        return true
    }
}

extension PartRepositoryImpl: PartRepository {}
