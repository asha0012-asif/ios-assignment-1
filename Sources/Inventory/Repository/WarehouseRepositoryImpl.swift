//
//  WarehouseRepositoryImpl.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-12.
//

import Foundation

struct WarehouseRepositoryImpl {
    func create(name: String, location: Location, contact: String, manager: String?) async -> Warehouse? {        
        let id = UUID()
        let warehouse = Warehouse(id: id, name: name, location: location, contactNumber: contact, manager: manager)
        
        Database.shared.add(element: warehouse)
        
        return warehouse
    }
    
    func get(id: UUID) async -> Warehouse? {
        return Database.shared.listWarehouse(id: id)
    }
    
    func list() async -> [Warehouse] {
        return Database.shared.listAllWarehouses()
    }
    
    func update(id: UUID, name: String, location: Location, contact: String, manager: String?) async -> Warehouse? {
        let updatedWarehouse = Warehouse(id: id, name: name, location: location, contactNumber: contact, manager: manager)
        
        return Database.shared.updateWarehouse(updatedWarehouse: updatedWarehouse)
    }
    
    func delete(id: UUID) async -> Bool {
        return Database.shared.deleteWarehouse(id: id)
    }
    
    func deleteAll() async -> Bool {
        return Database.shared.deleteAllWarehouses()
    }
}

extension WarehouseRepositoryImpl: WarehouseRepository {}
