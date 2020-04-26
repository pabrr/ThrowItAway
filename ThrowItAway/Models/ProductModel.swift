//
//  ProductModel.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import UIKit

final class ProductModel {

    // MARK: - Properties

    var id: UUID
    var name: String
    var dateTill: Date
    var image: UIImage?

    // MARK: - Init

    init(id: UUID = UUID(), name: String, dateTill: Date, image: UIImage? = nil) {
        self.id = id
        self.name = name
        self.dateTill = dateTill
        self.image = image
    }

}
