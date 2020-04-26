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

    var productSelector = UIPickerView()
    var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = .date
        return datePicker
    }()

    var product: ProductModel?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        if let product = product {
            configure(with: product)
        }
    }

}

// MARK: - UIPickerView

extension ProductDetailsViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return UserDefaults().defaultProducts.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UserDefaults().defaultProducts[row]
    }

}

// MARK: - Actions

private extension ProductDetailsViewController {

    @objc
    func saveProduct() {
        product == nil ? addNewProduct() : editProduct()
        navigationController?.popViewController(animated: true)
    }

}

// MARK: - Private Methods

private extension ProductDetailsViewController {

    func configureUI() {
        configureNavigationBar()
        configureViews()

        view.backgroundColor = traitCollection.userInterfaceStyle == .light ? .white : .black
    }

    func configureNavigationBar() {
        title = product == nil ? "Добавить продукт" : "Редактирование"

        let rightButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveProduct))
        navigationItem.rightBarButtonItem = rightButtonItem
    }

    func configureViews() {
        productSelector.dataSource = self
        productSelector.delegate = self
        view.addSubview(productSelector)
        productSelector.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }

        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(productSelector.snp.bottom).inset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }

    func configure(with existingProduct: ProductModel) {
        let selectedIndex = UserDefaults().defaultProducts.firstIndex(of: existingProduct.name) ?? 0
        productSelector.selectRow(selectedIndex, inComponent: 0, animated: true)
        datePicker.date = existingProduct.dateTill
    }

    func addNewProduct() {
        let selectedProductIndex = productSelector.selectedRow(inComponent: 0)
        let name = UserDefaults().defaultProducts[selectedProductIndex]
        let dateTill = datePicker.date
        let productModel = ProductModel(name: name, dateTill: dateTill)
        ProductsStorage.shared.save(productModel)
    }

    func editProduct() {

    }

}
