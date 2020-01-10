//
//  AdjustSensitivity.swift
//  ICanDraw
//
//  Created by Joao Batista on 07/01/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit

class AdjustSensitivity: UIView {
     let faceView: UIImageView = {
        let view = UIImageView()
        view.image =  UIImage(named: "lapis")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitial()
        backgroundColor = .white
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
            faceView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            faceView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            faceView.heightAnchor.constraint(equalToConstant: 50),
            faceView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
