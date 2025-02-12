//
//  PartRepositoryImpl.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-11.
//

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
}

extension PartRepositoryImpl: PartRepository {}
