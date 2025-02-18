//
//  WarehouseRepositoryImpl.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-12.
//

import Foundation

struct WarehouseRepositoryImpl {
    func create(name: String, location: Location, contact: String, manager: String?) async -> Warehouse? {
        guard let manager = manager else {
            return nil
        }
        
        let id = UUID()
        let warehouse = Warehouse(id: id, name: name, location: location, contactNumber: contact, manager: manager)
        
        await Database.shared.addWarehouse(warehouse: warehouse)
        
        return warehouse
    }
    
    func get(id: UUID) async -> Warehouse? {
        let foundWarehouse = await Database.shared.listWarehouse(id: id)
        return foundWarehouse
    }
    
    func list() async -> [Warehouse] {
        let allWarehouses = await Database.shared.listAllWarehouses()
        return allWarehouses
    }
    
    func update(id: UUID, name: String, location: Location, contact: String, manager: String?) async -> Warehouse? {
        guard let manager = manager else {
            return nil
        }
        
        let updatedWarehouse = Warehouse(id: id, name: name, location: location, contactNumber: contact, manager: manager)
        
        let result = await Database.shared.updateWarehouse(id: id, updatedWarehouse: updatedWarehouse)
        return result
    }
    
    func delete(id: UUID) async -> Bool {
        let isWarehouseDeleted = await Database.shared.deleteWarehouse(id: id)
        return isWarehouseDeleted
    }
    
    func deleteAll() async -> Bool {
        let allWarehousesDeleted = await Database.shared.deleteAllWarehouses()
        return allWarehousesDeleted
    }
}

extension WarehouseRepositoryImpl: WarehouseRepository {}
