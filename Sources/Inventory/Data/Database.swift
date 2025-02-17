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
        
    private init() {}
    
    private var parts: [Part] = []
    private var warehouses: [Warehouse] = []
    
    func listAllParts() -> [Part] {
        return parts
    }
    
    func addPart(part: Part) {
        parts.append(part)
    }
    
    func deletePart(id: UUID) {
        parts.removeAll { $0.id == id }
    }
    
    func deleteAllParts() {
        parts.removeAll()
    }
    
    func listAllWarehouses() -> [Warehouse] {
        return warehouses
    }
    
    func addWarehouse(warehouse: Warehouse) {
        warehouses.append(warehouse)
    }
    
    func deleteWarehouse(id: UUID) {
        warehouses.removeAll { $0.id == id }
    }
    
    func deleteAllWarehouses() {
        warehouses.removeAll()
    }
}
