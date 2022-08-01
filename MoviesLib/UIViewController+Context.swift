//
//  UIViewController+Context.swift
//  MoviesLib
//
//  Created by Juliano Costa Silva on 01/08/22.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
