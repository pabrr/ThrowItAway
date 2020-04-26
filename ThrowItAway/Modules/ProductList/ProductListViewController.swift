//
//  ProductListViewController.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import SnapKit

final class ProductListViewController: UIViewController {

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

}

// MARK: - UI Actions

private extension ProductListViewController {

    @objc
    func addProduct() {
        let viewController = ProductDetailsConfigurator().configure()
        navigationController?.pushViewController(viewController, animated: true)
    }

}

// MARK: - Private Methods

private extension ProductListViewController {

    func configureUI() {
        configureNavigationBar()
        configureTableView()
    }

    func configureNavigationBar() {
        title = "Что нам выбросить сегодня?"

        let addProductBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProduct))
        navigationItem.rightBarButtonItem = addProductBarItem
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
