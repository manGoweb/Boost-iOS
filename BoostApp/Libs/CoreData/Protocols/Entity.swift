//
//  Entity.swift
//  BoostApp
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


/// Type erased Entity
public protocol AnyEntity {
    /// Name of the entity
    static var entityName: String { get }
}

public protocol Entity: AnyEntity {
    
}


extension Entity {
    
    /// Typealias for NSFetchRequest
    public typealias Request = NSFetchRequest<NSFetchRequestResult>
    
    /// Name of the entity, converted from the name of the class by default
    public static var entityName: String {
        let name = String(describing: self)
        return name
    }
    
    /// Create new query
    public static var query: Query {
        print(self)
        return Query(self)
    }
    
    /// Basic fetch request
    public static var fetchRequest: Request {
        let fetch = Request(entityName: entityName)
        return fetch
    }
    
    /// Get all items based on optional criteria and sorting
    public static func all(filter: NSPredicate? = nil, sort: [NSSortDescriptor] = [], limit: Int = 0) throws -> [Self] {
        let fetch = fetchRequest
        fetch.predicate = filter
        if !sort.isEmpty {
            fetch.sortDescriptors = sort
        }
        if limit > 0 {
            fetch.fetchLimit = limit
        }
        guard let all = try CoreData.managedContext.fetch(fetch) as? [Self] else {
            throw CoreData.Problem.badData
        }
        return all
    }
    
    /// Count all items
    public static func count() throws -> Int {
        let count = try CoreData.managedContext.count(for: fetchRequest)
        return count
    }
    
    /// Save context
    public func save() throws {
        try CoreData.saveContext()
    }
    
}