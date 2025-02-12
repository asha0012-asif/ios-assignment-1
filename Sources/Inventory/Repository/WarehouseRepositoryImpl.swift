//
//  WarehouseRepositoryImpl.swift
//  Inventory
//
//  Created by Asif Ashadullah on 2025-02-12.
//

struct WarehouseRepositoryImpl {
    func create(name: String, location: Location, contact: String, manager: String?) async -> Warehouse? {
        guard let manager = manager else {
            return nil
        }
        
        let warehouse = Warehouse(name: name, location: location, contact: contact, manager: manager)
        
        await Database.shared.addWarehouse(warehouse: warehouse)
        
        return warehouse
    }
}

extension WarehouseRepositoryImpl: WarehouseRepository {}
