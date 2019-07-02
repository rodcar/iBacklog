//
//  BacklogStore.swift
//  iBacklog
//
//  Created by user155748 on 7/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation
import CoreData

class  BacklogStore {
    
    let userstoryEntity = UserstoryEntity()
    static let shared = BacklogStore()
    
    private init() {}
    
    func addUserstory(_ description: String, _ storypoints: Int) {
        userstoryEntity.add(description, storypoints)
    }
    
    func allUserstories() -> [NSManagedObject]? {
        return userstoryEntity.all()
    }
    
}
