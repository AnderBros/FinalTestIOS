//
//  TrackBL.swift
//  FinalTestIOS
//
//  Created by user171789 on 7/7/20.
//  Copyright © 2020 user171789. All rights reserved.
//

import Foundation
import UIKit

class TrackBL {
    
    typealias Create = (_ objTrack: Track) -> Void
    typealias ErrorMessage = (_ errorMessage: String) -> Void
    
    class func create(duration: String?, name: String?, success: Create, error: ErrorMessage) {
        
        guard let saveName = name, saveName.count != 0 else {
            error("Ingresa un nombre correcto.")
            return
        }
        
        guard let saveDuration = duration, saveDuration.count != 0 else {
            error("Ingresa una duración correcta.")
            return
        }
        
        let appDelegateInstance = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateInstance.persistentContainer.viewContext
        
        let objDT = TrackDA.create(duration: saveDuration, name: saveName, context: context)
        appDelegateInstance.saveContext()
        success(objDT)
    }
    
    class func listAll() -> [Track] {
        
        let appDelegateInstance = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateInstance.persistentContainer.viewContext
        return TrackDA.listAll(context: context)
    }
    /*
    class func listAllBySearchKey(searchKey: String) -> [Disc] {
        
        let appDelegateInstance = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateInstance.persistentContainer.viewContext
        return DiscDA.listAllBySearchKey(searchKey: searchKey, context: context)
    }*/
    
    class func delete(_ objTrack: Track) {
        
        let appDelegateInstance = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateInstance.persistentContainer.viewContext
        context.delete(objTrack)
        appDelegateInstance.saveContext()
    }
    
}
