//
//  UserDefaults.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import Foundation

extension UserDefaults {

    var defaultProducts: [String] {
        get {
            if let products = UserDefaults().stringArray(forKey: #function) {
                return products
            }

            let products = Constants.defaultProducts
            UserDefaults().defaultProducts = products
            return products
        }
        set { UserDefaults().set(newValue, forKey: #function) }
    }

}
