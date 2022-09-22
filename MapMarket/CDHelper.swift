//
//  CDHelper.swift
//  MapMarket
//
//  Created by Julie Hess on 9/22/22.
//

import CoreData
import UIKit

func makeAllOrganizations() {
    //MARK: add organization info here
    makeOrganization(name: "LightUpTheWalls", withThe: "LightUpTheWalls")
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}
func makeOrganization(name: String, withThe imageName: String){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let organization = Organizations(context: context)
    organization.name = name
    organization.imageFileName = imageName
    
}
func bringAllOrganizations() -> [Organizations] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
        let organizations = try context.fetch(Organizations.fetchRequest()) as! [Organizations]
        if organizations.count == 0 {
            makeAllOrganizations()
            return bringAllOrganizations()
        }
        return organizations
    } catch {
        print("we were unable to find any organizations")
    }
    return []
}
func getAllFoundOrganizations() -> [Organizations] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchRequest = Organizations.fetchRequest() as NSFetchRequest<Organizations>
    fetchRequest.predicate = NSPredicate(format: "timesCaught == %d", 0)
    do {
        let organizations = try context.fetch(fetchRequest) as [Organizations]
        return organizations
    }
    catch {
        print("we were unable to find any organizations")
    }
    return []
}
func getAllUnfoundOrganizations() -> [Organizations] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchRequest = Organizations.fetchRequest() as NSFetchRequest<Organizations>
    fetchRequest.predicate = NSPredicate(format: "timesCaught == %d", 0)
    do {
        let organizations = try context.fetch(fetchRequest) as [Organizations]
        return organizations
    }
    catch {
        print("we were unable to find any organizations")
    }
    return []
}
    
