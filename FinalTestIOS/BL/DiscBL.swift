//
//  DiscBL.swift
//  FinalTestIOS
//
//  Created by user171789 on 7/7/20.
//  Copyright © 2020 user171789. All rights reserved.
//

import Foundation
import UIKit

class DiscBL {
    
    typealias Create = (_ objDisc: Disc) -> Void
    typealias ErrorMessage = (_ errorMessage: String) -> Void
    
    class func create(artist: String?, description: String?, state: Int16?, genre: String?, name: String?, urlImage: String?, year: String?, success: Create, error: ErrorMessage) {
        
        guard let saveName = name, saveName.count != 0 else {
            error("Ingresa un nombre correcto.")
            return
        }
        
        guard let saveArtist = artist, saveArtist.count != 0 else {
            error("Ingresa un nombre de artista correcto.")
            return
        }
        
        guard let saveGenre = genre, saveGenre.count != 0 else {
            error("Ingresa un género musical correcto.")
            return
        }
        
        guard let saveYear = year, saveYear.count != 0 else {
            error("Ingresa un año correcto.")
            return
        }
        
        guard let saveDescription = description, saveDescription.count != 0 else {
            error("Ingresa una descripción correcta.")
            return
        }
        
        guard let saveUrlImage = urlImage, saveUrlImage.count != 0 else {
            error("Ingresa una url correcta.")
            return
        }
        
        let appDelegateInstance = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateInstance.persistentContainer.viewContext
        
        let objDD = DiscDA.create(artist: saveArtist, description: saveDescription, state: 0, genre: saveGenre, name: saveName, urlImage: saveUrlImage, year: saveYear, context: context)
        appDelegateInstance.saveContext()
        success(objDD)
    }
    
    class func listAll() -> [Disc] {
        
        let appDelegateInstance = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateInstance.persistentContainer.viewContext
        return DiscDA.listAll(context: context)
    }
    /*
    class func listAllBySearchKey(searchKey: String) -> [Disc] {
        
        let appDelegateInstance = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateInstance.persistentContainer.viewContext
        return DiscDA.listAllBySearchKey(searchKey: searchKey, context: context)
    }*/
    
    class func delete(_ objDisc: Disc) {
        
        let appDelegateInstance = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateInstance.persistentContainer.viewContext
        context.delete(objDisc)
        appDelegateInstance.saveContext()
    }
    
}
