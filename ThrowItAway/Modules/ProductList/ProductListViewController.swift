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

    @objc
    func showSettings() {

    }

}

// MARK: - Private Methods

private extension ProductListViewController {

    func configureUI() {
        configureNavigationBar()
        configureTableView()
        addFloatingButton()
    }

    func configureNavigationBar() {
        title = "Что нам выбросить сегодня?"

        let settingsBarItem = UIBarButtonItem(barButtonSystemItem: .compose,
                                              target: self,
                                              action: #selector(showSettings))
        navigationItem.rightBarButtonItem = settingsBarItem
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func addFloatingButton() {
        let floatingButton = FloatingButton()
        floatingButton.didSelectHandler = { [weak self] in
            self?.addProduct()
        }
        view.addSubview(floatingButton)
        floatingButton.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(32)
            make.right.equalTo(-16)
            make.bottomMargin.equalTo(-16)
        }
    }

}
