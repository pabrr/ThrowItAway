//
//  ProductListViewController.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import SnapKit

final class ProductListViewController: UIViewController {

    // MARK: - Private Properties

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()

    private var products: [ProductModel] = []

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }

}

// MARK: - UITableView

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "productCell")
        cell.textLabel?.text = products[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        let viewController = ProductDetailsConfigurator().configure(with: product)
        navigationController?.pushViewController(viewController, animated: true)
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

    func updateData() {
        products = ProductsStorage.shared.getProducts()
        tableView.reloadData()
    }

    func configureUI() {
        configureNavigationBar()
        configureTableView()
        addFloatingButton()
    }

    func configureNavigationBar() {
        title = "Что нам выбросить сегодня?"

        let settingsBarItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                              style: .plain,
                                              target: self,
                                              action: #selector(showSettings))
        navigationItem.rightBarButtonItem = settingsBarItem
    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self

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
            make.right.equalTo(-16)
            make.bottomMargin.equalTo(-16)
        }
    }

}
