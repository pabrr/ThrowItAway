//
//  DefaultProductsSettingsViewController.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import UIKit

final class DefaultProductsSettingsViewController: UIViewController {

    // MARK: - Private Properties

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = nil
        return tableView
    }()

    private var defaultProducts: [DefaultProductCellViewModel] = []

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        updateData()
    }

}

// MARK: - UITableView

extension DefaultProductsSettingsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultProductCell.cellId) as? DefaultProductCell
            else {
                return UITableViewCell()
        }
        let defaultProductViewModel = defaultProducts[indexPath.row]
        cell.configure(with: defaultProductViewModel)
        cell.editNameHandler = { [weak self] newName in
            self?.edit(product: defaultProductViewModel.name, newName: newName)
        }
        cell.deleteProductHandler = { [weak self] in
            self?.delete(product: defaultProductViewModel.name)
        }
        return cell
    }

}

// MARK: - Private Methods

private extension DefaultProductsSettingsViewController {

    func updateData() {
        defaultProducts = UserDefaults().defaultProducts.map { DefaultProductCellViewModel(name: $0, isEditing: false) }
        tableView.reloadData()
    }

    func configureUI() {
        configureNavigationBar()
        configureTableView()
        addFloatingButton()
    }

    func configureNavigationBar() {
        title = "Список продуктов по умолчанию"
    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(DefaultProductCell.self, forCellReuseIdentifier: DefaultProductCell.cellId)

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func addFloatingButton() {
        let floatingButton = FloatingButton()
        floatingButton.didSelectHandler = { [weak self] in
            self?.addNewProduct()
        }
        view.addSubview(floatingButton)
        floatingButton.snp.makeConstraints { make in
            make.right.equalTo(-16)
            make.bottomMargin.equalTo(-16)
        }
    }

    func edit(product: String, newName: String) {
        guard let selectedIndex = UserDefaults().defaultProducts.firstIndex(of: product) else { return }
        delete(product: product, needReload: false)
        UserDefaults().defaultProducts.insert(newName, at: selectedIndex)
        updateData()
    }

    func delete(product: String, needReload: Bool = true) {
        guard let selectedIndex = UserDefaults().defaultProducts.firstIndex(of: product) else { return }
        UserDefaults().defaultProducts.remove(at: selectedIndex)
        needReload ? updateData() : nil
    }

    func addNewProduct() {
        defaultProducts = UserDefaults().defaultProducts.map { DefaultProductCellViewModel(name: $0, isEditing: false) }
        UserDefaults().defaultProducts.append("")
        defaultProducts.append(DefaultProductCellViewModel(name: "", isEditing: true))
        tableView.reloadData()
    }

}
