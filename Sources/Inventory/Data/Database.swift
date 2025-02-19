//
//  Database.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-11.
//

import Foundation

@MainActor
class Database {
    static let shared = Database()
    
    private var parts: [Part] = []
    private var warehouses: [Warehouse] = []
    
    func add(element: Part) {
        parts.append(element)
    }
    
    func listPart(id: UUID) -> Part? {
        return parts.filter { $0.id == id }.first ?? nil
    }
    
    func listAllParts() -> [Part] {
        return parts
    }
    
    func updatePart(updatedPart: Part) -> Part? {
        if let index = parts.firstIndex(where: { $0.id == updatedPart.id }) {
            parts[index] = updatedPart
            return parts[index]
        }
        
        return nil
    }
    
    func deletePart(id: UUID) -> Bool {
        let foundPart = parts.filter { $0.id == id }.first ?? nil
        
        if foundPart != nil {
            parts.removeAll { $0.id == id }
            return true
        }
        
        return false
    }
    
    func deleteAllParts() -> Bool {
        parts.removeAll()
        
        if parts.isEmpty {
            return true
        }
        
        return false
    }
    
    func add(element: Warehouse) {
        warehouses.append(element)
    }
    
    func listWarehouse(id: UUID) -> Warehouse? {
        return warehouses.filter { $0.id == id }.first ?? nil
    }
    
    func listAllWarehouses() -> [Warehouse] {
        return warehouses
    }
    
    func updateWarehouse(id: UUID, updatedWarehouse: Warehouse) -> Warehouse? {
        if let index = warehouses.firstIndex(where: { $0.id == id }) {
            warehouses[index] = updatedWarehouse
            return warehouses[index]
        }
        
        return nil
    }
    
    func deleteWarehouse(id: UUID) -> Bool {
        let foundWarehouse = warehouses.filter { $0.id == id }.first ?? nil
        
        if foundWarehouse != nil {
            warehouses.removeAll { $0.id == id }
            return true
        }
        
        return false
    }
    
    func deleteAllWarehouses() -> Bool {
        warehouses.removeAll()
        
        if warehouses.isEmpty {
            return true
        }
        
        return false
    }
}
