//
//  SetupView.swift
//  MovieViper
//
//  Created by hossein on 9/28/1401 AP.
//

import Foundation

protocol SetupView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension SetupView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
