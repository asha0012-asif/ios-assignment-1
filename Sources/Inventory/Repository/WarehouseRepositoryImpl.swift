//
//  WarehouseRepositoryImpl.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-12.
//

import Foundation

struct WarehouseRepositoryImpl {
    func create(name: String, location: Location, contact: String, manager: String?) async throws -> Warehouse? {
        let id = UUID()
        let warehouse = Warehouse(id: id, name: name, location: location, contactNumber: contact, manager: manager)
        
        Database.shared.add(element: warehouse)
        return warehouse
    }
    
    func get(id: UUID) async throws -> Warehouse? {
        return Database.shared.listWarehouse(id: id)
    }
    
    func list() async throws -> [Warehouse] {
        return Database.shared.listAllWarehouses()
    }
    
    func update(id: UUID, name: String, location: Location, contact: String, manager: String?) async throws -> Warehouse? {
        let updatedWarehouse = Warehouse(id: id, name: name, location: location, contactNumber: contact, manager: manager)
        return Database.shared.update(element: updatedWarehouse)
    }
    
    func delete(id: UUID) async throws -> Bool {
        let foundWarehouse = Database.shared.listWarehouse(id: id)
        return Database.shared.delete(foundWarehouse: foundWarehouse)
    }
    
    func deleteAll() async throws -> Bool {
        return Database.shared.deleteAllWarehouses()
    }
}

extension WarehouseRepositoryImpl: WarehouseRepository {}
