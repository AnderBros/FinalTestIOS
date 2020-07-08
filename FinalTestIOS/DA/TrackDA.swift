//
//  TrackDA.swift
//  FinalTestIOS
//
//  Created by user171789 on 7/7/20.
//  Copyright © 2020 user171789. All rights reserved.
//

import Foundation
import CoreData

class TrackDA {
    
    class func create(duration: String, name: String, context: NSManagedObjectContext) -> Track {
        
        let objDT = NSEntityDescription.insertNewObject(forEntityName: "Track", into: context) as! Track
        
        objDT.track_duration = duration
        objDT.track_name = name
        
        return objDT
    }
    
    class func listAll(context: NSManagedObjectContext) -> [Track] {
        
        let fetchRequest: NSFetchRequest<Track> = Track.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            return result
        }catch {
            return []
        }
    }
    
    //TODO: listAllBySearchKey
}
