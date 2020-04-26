//
//  FloatingButton.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import UIKit

final class FloatingButton: UIButton {

    // MARK: - Constants

    private enum Constants {
        static let defaultWidth: CGFloat = 54
    }

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
        setImage(UIImage(systemName: "plus.circle"), for: .normal)
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tintColor = .systemBlue

        addTarget(self, action: #selector(didSelect), for: .touchUpInside)

        snp.makeConstraints { make in
            make.width.equalTo(Constants.defaultWidth)
            make.height.equalTo(Constants.defaultWidth)
        }
    }

}
