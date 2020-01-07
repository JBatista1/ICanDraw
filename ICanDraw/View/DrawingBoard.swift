//
//  DrawingBoard.swift
//  ICanDraw
//
//  Created by Joao Batista on 06/01/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit

class DrawingBoard: UIView {
    
    let imageForDraw: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        return image
    }()
    let imageDraw: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
       
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setupInitial()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DrawingBoard: CodeView {
    func setupView() {
        addSubview(imageForDraw)
        addSubview(imageDraw)
    }
    
    func setupConstrants() {
        NSLayoutConstraint.activate([
            imageDraw.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            imageDraw.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            imageDraw.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageDraw.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            imageForDraw.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            imageForDraw.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            imageForDraw.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageForDraw.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
}
