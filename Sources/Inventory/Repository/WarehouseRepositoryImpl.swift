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
        
        let warehouse = Warehouse(name: name, location: location, contact: contact, manager: manager)
        
        await Database.shared.addWarehouse(warehouse: warehouse)
        
        return warehouse
    }
    
    func get(id: UUID) async -> Warehouse? {
        let allWarehouses = await Database.shared.listAllWarehouses()
        
        let foundWarehouse = allWarehouses.filter { $0.id == id }.first
        return foundWarehouse
    }
    
    func list() async -> [Warehouse] {
        let allWarehouses = await Database.shared.listAllWarehouses()
        return allWarehouses
    }
    
    func update(id: UUID, name: String, location: Location, contact: String, manager: String?) async -> Warehouse? {
        #warning("Implement update logic here")
    }
    
    func delete(id: UUID) async -> Bool {
        let allWarehouses = await Database.shared.listAllWarehouses()
        let foundWarehouse = allWarehouses.filter { $0.id == id }.first
        
        await Database.shared.deleteWarehouse(id: id)
        
        return true
    }
    
    func deleteAll() async -> Bool {
        await Database.shared.deleteAllWarehouses()
        return true
    }
}

extension WarehouseRepositoryImpl: WarehouseRepository {}
