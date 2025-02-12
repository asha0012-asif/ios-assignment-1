//
//  PartRepositoryImpl.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-11.
//

struct PartRepositoryImpl {
    func create(name: String, category: PartCategory, size: Dimensions?, weight: Double?) -> Part? {
        guard let size = size else {
            return nil
        }
        
        guard let weight = weight else {
            return nil
        }
        
        let part = Part(name: name, category: category, size: size, weight: weight)
        return part
    }
}

extension PartRepositoryImpl: PartRepository {}
