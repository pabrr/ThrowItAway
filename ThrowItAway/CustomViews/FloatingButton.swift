//
//  FloatingButton.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import UIKit

final class FloatingButton: UIButton {

    // MARK: - Properties

    var didSelectHandler: EmptyClosure?

    init() {
        super.init(frame: .zero)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - UIActions

private extension FloatingButton {

    @objc
    func didSelect() {
        didSelectHandler?()
    }

}

// MARK: - Private Methods

private extension FloatingButton {

    func configureUI() {
        setTitle("+", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 24)
        setTitleColor(.systemBlue, for: .normal)

        addTarget(self, action: #selector(didSelect), for: .touchUpInside)
    }

}
