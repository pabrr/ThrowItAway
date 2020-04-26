//
//  ProductDetailsConfigurator.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import UIKit

final class ProductDetailsConfigurator {

    func configure(with product: ProductModel? = nil) -> UIViewController {
        let viewController = ProductDetailsViewController()
        viewController.product = product
        return viewController
    }

}
