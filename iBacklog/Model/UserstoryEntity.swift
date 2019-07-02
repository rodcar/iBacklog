//
//  UserstoryEntity.swift
//  iBacklog
//
//  Created by user155748 on 7/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class UserstoryEntity {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let entityName = "Userstory"
    
    func add(_ description: String, _ storypoints: Int) {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        let userstory = NSManagedObject(entity: entity!, insertInto: context)
        userstory.setValue(description, forKey: "desc")
        userstory.setValue(storypoints, forKey: "storypoints")
        save()
    }
    
    func save() {
        appDelegate.saveContext()
    }
    
    func all() -> [NSManagedObject]? {
        return find(withPredicate: nil)
    }
    
    func find(withPredicate predicate: NSPredicate?) -> [NSManagedObject]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        if let predicate = predicate {
            request.predicate = predicate
        }
        do {
            let results = try context.fetch(request)
            return results as? [NSManagedObject]
        } catch let error as NSError {
            print(error.userInfo)
        }
        return nil
    }
    
}
