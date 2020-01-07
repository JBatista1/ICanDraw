//
//  CodeView.swift
//  ICanDraw
//
//  Created by Joao Batista on 06/01/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
protocol CodeView {
    func setupInitial()
    func setupView()
    func setupConstrants()
}
extension CodeView {
    func setupInitial() {
        setupView()
        setupConstrants()
    }
}
