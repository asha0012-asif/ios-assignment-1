//
//  Database.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-11.
//

import Foundation

final class Database: @unchecked Sendable {
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
    
    func update(element: Part) -> Part? {
        if let index = parts.firstIndex(where: { $0.id == element.id }) {
            parts[index] = element
            return parts[index]
        }
        
        return nil
    }
    
    func delete(foundPart: Part?) -> Bool {
        if let foundPart {
            parts.removeAll { $0.id == foundPart.id }
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
    
    func update(element: Warehouse) -> Warehouse? {
        if let index = warehouses.firstIndex(where: { $0.id == element.id }) {
            warehouses[index] = element
            return warehouses[index]
        }
        
        return nil
    }
    
    func delete(foundWarehouse: Warehouse?) -> Bool {
        if let foundWarehouse {
            warehouses.removeAll { $0.id == foundWarehouse.id }
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
