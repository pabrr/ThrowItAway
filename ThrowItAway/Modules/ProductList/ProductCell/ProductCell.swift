//
//  ProductCell.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import UIKit

final class ProductCell: UITableViewCell {

    // MARK: - Views

    let nameLabel = UILabel()
    let daysLeftTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Осталось хранить:"
        return label
    }()
    let daysLeftLabel = UILabel()
    let dateTillLabel = UILabel()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Internal Methods

    func configure(with viewModel: ProductCellViewModel) {
        nameLabel.text = viewModel.name
        daysLeftLabel.text = viewModel.daysLeft
        daysLeftLabel.textColor = viewModel.daysLeftColor
        dateTillLabel.text = viewModel.dateTill
    }

}

// MARK: - Private Methods

private extension ProductCell {

    func configureUI() {
        addViews()
    }

    func addViews() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }

        addSubview(daysLeftTitleLabel)
        daysLeftTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(-12)
            make.left.equalTo(nameLabel)
            make.bottom.equalTo(-12)
        }

        addSubview(daysLeftLabel)
        daysLeftLabel.snp.makeConstraints { make in
            make.centerY.equalTo(daysLeftTitleLabel)
            make.left.equalTo(daysLeftTitleLabel.snp.right).inset(-4)
        }

        addSubview(dateTillLabel)
        dateTillLabel.snp.makeConstraints { make in
            make.centerY.equalTo(daysLeftTitleLabel)
            make.right.equalTo(-16)
        }
    }

}
