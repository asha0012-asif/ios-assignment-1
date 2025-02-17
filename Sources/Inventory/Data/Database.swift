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
    
    func addPart(part: Part) {
        parts.append(part)
    }
    
    func listPart(id: UUID) -> Part? {
        return parts.filter { $0.id == id }.first ?? nil
    }
    
    func listAllParts() -> [Part] {
        return parts
    }
    
    func deletePart(id: UUID) {
        parts.removeAll { $0.id == id }
    }
    
    func deleteAllParts() {
        parts.removeAll()
    }
    
    func addWarehouse(warehouse: Warehouse) {
        warehouses.append(warehouse)
    }
    
    func listWarehouse(id: UUID) -> Warehouse? {
        return warehouses.filter { $0.id == id }.first ?? nil
    }
    
    func listAllWarehouses() -> [Warehouse] {
        return warehouses
    }
    
    func deleteWarehouse(id: UUID) {
        warehouses.removeAll { $0.id == id }
    }
    
    func deleteAllWarehouses() {
        warehouses.removeAll()
    }
}
