//
//  CoreDataManager.swift
//  SushiShop
//
//  Created by Dmitriy Eliseev on 04.04.2024.
//

import Foundation
import UIKit
import CoreData

//MARK: - CRUD (Creare-Read-Update-Delete)
public final class CoreDataManager: NSObject {
    static let shared = CoreDataManager()
    private override init(){} //override - так как наследуется от NSObject
    private var context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    //create Entity roll Makizushi
    public func createMakizushi(
        title: String,
        description: String,
        weight: Int16,
        prise: Double,
        image: String
    )->Bool{
        guard let context else {
            return false
        }
        guard let makizushiEntityDescription = NSEntityDescription.entity(
            forEntityName: "Makizushi",
            in: context
        ) else {
            return false
        }
        let makizushi = Makizushi(
            entity: makizushiEntityDescription,
            insertInto: context
        )
        makizushi.rollTitle = title
        makizushi.rollDescription = description
        makizushi.rollWeight = weight
        makizushi.rollPrise = prise
        let image = UIImage(named: image)
        makizushi.rollImage = image?.jpegData(
            compressionQuality: 1.0
        )
        do {
            try context.save()
            return true
        } catch let err as NSError {
            print(err.userInfo)
            return false
        }
    }
    
    public func fetchMakizushi(title: String)->Makizushi?{
        guard let context else {
            return nil
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: "Makizushi"
        )
        do {
            let rolls = try? context.fetch(fetchRequest) as? [Makizushi]
            return rolls?.first(where: {$0.rollTitle == title})
        }
    }
    
    public func updateMakizushi(title: String, newTitle: String)->Bool{
        guard let context else {
            return false
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: "Makizushi"
        )
        do {
            guard  let rolls = try? context.fetch(fetchRequest) as? [Makizushi],
                   let roll = rolls.first(where: {$0.rollTitle == title}) else {return false}
            roll.rollTitle = newTitle
            try context.save()
            return true
        } catch let err as NSError {
            print(err.userInfo)
            return false
        }
    }
    
    public func updateMakizushi(title: String, newDescription: String)->Bool{
        guard let context else {
            return false
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: "Makizushi"
        )
        do {
            guard  let rolls = try? context.fetch(fetchRequest) as? [Makizushi],
                   let roll = rolls.first(where: {$0.rollTitle == title}) else {return false}
            roll.rollDescription = newDescription
            try context.save()
            return true
        } catch let err as NSError {
            print(err.userInfo)
            return false
        }
    }
    
    public func updateMakizushi(title: String, newWeight: Int16)->Bool{
        guard let context else {
            return false
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: "Makizushi"
        )
        do {
            guard  let rolls = try? context.fetch(fetchRequest) as? [Makizushi],
                   let roll = rolls.first(where: {$0.rollTitle == title}) else {return false}
            roll.rollWeight = newWeight
            try context.save()
            return true
        } catch let err as NSError {
            print(err.userInfo)
            return false
        }
    }
    
    public func updateMakizushi(title: String, newPrise: Double)->Bool{
        guard let context else {
            return false
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: "Makizushi"
        )
        do {
            guard  let rolls = try? context.fetch(fetchRequest) as? [Makizushi],
                   let roll = rolls.first(where: {$0.rollTitle == title}) else {return false}
            roll.rollPrise = newPrise
            try context.save()
            return true
        } catch let err as NSError {
            print(err.userInfo)
            return false
        }
    }
    
    public func updateMakizushi(title: String, newImage: String)->Bool{
        guard let context else {
            return false
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: "Makizushi"
        )
        guard let image = UIImage(named: newImage) else {return false}
        do {
            guard  let rolls = try? context.fetch(fetchRequest) as? [Makizushi],
                   let roll = rolls.first(where: {$0.rollTitle == title}) else {return false}
            roll.rollImage = image.jpegData(compressionQuality: 1.0)
            try context.save()
            return true
        } catch let err as NSError {
            print(err.userInfo)
            return false
        }
    }
    
    
    public func deleteMakizushi(title: String)->Bool{
        guard let context else {
            return false
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: "Makizushi"
        )
        do {
            guard  let rolls = try? context.fetch(fetchRequest) as? [Makizushi],
                   let roll = rolls.first(where: {$0.rollTitle == title}) else {return false}
            context.delete(roll)
            return true
        }
    }
    
    //CountMakizushiInEntity
    public func countOfMakizushi()->Int{
        guard let context else {
            return 0
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: "Makizushi"
        )
        do {
            guard  let rolls = try? context.fetch(fetchRequest) as? [Makizushi] else {return 0}
            return rolls.count
        }
    }
    
    public func getMakizushi(index: Int)->MakizushiModel?{
        guard let context else {
            return nil
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: "Makizushi"
        )
        do {
            guard  let rolls = try? context.fetch(fetchRequest) as? [Makizushi] else {return nil}
            let image = UIImage(data: rolls[index].rollImage!)
            return MakizushiModel.init(title: rolls[index].rollTitle!, description: rolls[index].rollDescription!, weight: rolls[index].rollWeight, prise: rolls[index].rollPrise, image: image!)
        }
        
       
    }
    
    
}



