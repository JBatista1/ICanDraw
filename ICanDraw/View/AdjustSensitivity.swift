//
//  AdjustSensitivity.swift
//  ICanDraw
//
//  Created by Joao Batista on 07/01/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit

class AdjustSensitivity: UIView {
    private let faceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitial()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension AdjustSensitivity: CodeView {
    func setupView() {
        addSubview(faceView)
    }
    
    func setupConstrants() {
        NSLayoutConstraint.activate([
            faceView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            faceView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            faceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            faceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
}
