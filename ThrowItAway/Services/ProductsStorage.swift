//
//  ProductsStorage.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import UIKit
import CoreData

final class ProductsStorage {

    // MARK: - Properties

    static var shared = ProductsStorage()

    // MARK: - Private Properties

    private var products: [NSManagedObject] = []

    private var managedContext: NSManagedObjectContext? = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.persistentContainer.viewContext
    }()

    // MARK: - Init

    private init() { }

    // MARK: - Internal Methods

    func loadData() {
        guard let managedContext = managedContext else { return }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Product")

        do {
            products = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

    func getProducts() -> [ProductModel] {
        return products.map { entity in
            guard
                let id = entity.value(forKey: "id") as? UUID,
                let name = entity.value(forKey: "name") as? String,
                let dateTill = entity.value(forKey: "dateTill") as? Date else {
                    return nil
            }
            return ProductModel(id: id, name: name, dateTill: dateTill)
        }.compactMap { $0 }
    }

    func save(_ model: ProductModel) {
        guard
            let managedContext = managedContext,
            let entity = NSEntityDescription.entity(forEntityName: "Product", in: managedContext) else { return }

        let product = NSManagedObject(entity: entity, insertInto: managedContext)
        product.setValue(model.id, forKeyPath: "id")
        product.setValue(model.name, forKeyPath: "name")
        product.setValue(model.dateTill, forKeyPath: "dateTill")

        do {
            try managedContext.save()
            products.append(product)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    func deleteAll() {
        guard let managedContext = managedContext else { return }
        do {
            try managedContext.save()
            products.removeAll()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}
