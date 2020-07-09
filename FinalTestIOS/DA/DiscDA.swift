//
//  DiscDA.swift
//  FinalTestIOS
//
//  Created by user171789 on 7/7/20.
//  Copyright © 2020 user171789. All rights reserved.
//

import Foundation
import CoreData

class DiscDA {
    
    class func create(artist: String, description: String, state: Int16, genre: String, name: String, urlImage: String, year: String, context: NSManagedObjectContext) -> Disc {
        
        let objDD = NSEntityDescription.insertNewObject(forEntityName: "Disc", into: context) as! Disc
        
        objDD.disc_artist = artist
        objDD.disc_description = description
        objDD.disc_favoriteState = state
        objDD.disc_genre = genre
        objDD.disc_name = name
        objDD.disc_urlImage = urlImage
        objDD.disc_year = year
        
        return objDD
    }
    
    class func listAll(context: NSManagedObjectContext) -> [Disc] {
        
        let fetchRequest: NSFetchRequest<Disc> = Disc.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            return result
        }catch {
            return []
        }
    }
    
    //TODO: listAllBySearchKey
}
