//
//  DefaultProductCell.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import UIKit

final class DefaultProductCell: UITableViewCell {

    // MARK: - Views

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.allowsEditingTextAttributes = false
        return textField
    }()

    private let editNameButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        return button
    }()

    private let deleteProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        return button
    }()

    // MARK: - Properties

    var editNameHandler: StringClosure?
    var deleteProductHandler: EmptyClosure?

    // MARK: - Private Properties

    private var isEditingName: Bool {
        get {
            return nameTextField.isEditing
        }
    }

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Internal Methods

    func configure(with productName: String) {
        nameTextField.text = productName

        configureButtons()
    }

}

// MARK: - UIActions

private extension DefaultProductCell {

    @objc
    func editNameSelected() {
        let editButtonIconName = isEditingName ? "pencil" : "checkmark"
        editNameButton.setImage(UIImage(systemName: editButtonIconName), for: .normal)

        nameTextField.allowsEditingTextAttributes = !isEditingName

        if isEditingName {
            editNameHandler?(nameTextField.text ?? "")
            resignFirstResponder()
        } else {
            nameTextField.becomeFirstResponder()
        }
    }

    @objc
    func deleteProductSelected() {
        deleteProductHandler?()
    }

}

// MARK: - Private Methods

private extension DefaultProductCell {

    func configureButtons() {
        editNameButton.addTarget(self, action: #selector(editNameSelected), for: .touchUpInside)

        deleteProductButton.addTarget(self, action: #selector(deleteProductSelected), for: .touchUpInside)
    }

    func configureUI() {
        addViews()
    }

    func addViews() {
        addSubview(deleteProductButton)
        deleteProductButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-16)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }

        addSubview(editNameButton)
        editNameButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(deleteProductButton.snp.left).inset(-8)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }

        addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
            make.right.equalTo(editNameButton.snp.left).inset(-16)
        }
    }

}
