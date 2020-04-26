//
//  ProductDetailsViewController.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import SnapKit

final class ProductDetailsViewController: UIViewController {

    // MARK: - Private Properties

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()

    var product: Any?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

}

// MARK: - Actions

private extension ProductDetailsViewController {

    @objc
    func saveProduct() {

    }

}

// MARK: - Private Methods

private extension ProductDetailsViewController {

    func configureUI() {
        configureNavigationBar()
        configureTableView()
    }

    func configureNavigationBar() {
        title = product == nil ? "Добавить продукт" : "Редактирование"

        let rightButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveProduct))
        navigationItem.rightBarButtonItem = rightButtonItem
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
