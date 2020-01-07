//
//  DrawingBoardViewController.swift
//  ICanDraw
//
//  Created by Joao Batista on 06/01/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit

class DrawingBoardViewController: UIViewController {
    var lastPoint = CGPoint.zero
    var swiped = false
    var drawingBoard = DrawingBoard(frame: .zero)
    var draw: Draw!
    override func viewDidLoad() {
        super.viewDidLoad()
        draw = Draw(imageViewForDraw: drawingBoard.imageForDraw, brushWidth: 5.0, colorBrush: .black, opacity: 1.0)
    }
    override func loadView() {
        view = drawingBoard
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = false
        lastPoint = touch.location(in: drawingBoard.imageDraw)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = true
        let currentPoit = touch.location(in: drawingBoard.imageDraw)
        draw.line(from: lastPoint, to: currentPoit)
        lastPoint = currentPoit
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            draw.line(from: lastPoint, to: lastPoint)
        }
        UIGraphicsBeginImageContext(drawingBoard.imageDraw.frame.size)
        drawingBoard.imageDraw.image?.draw(in: drawingBoard.imageDraw.bounds, blendMode: .normal, alpha: 1.0)
        drawingBoard.imageForDraw.image?.draw(in: drawingBoard.imageDraw.bounds, blendMode: .normal, alpha: 1.0)
        drawingBoard.imageDraw.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        drawingBoard.imageForDraw.image = nil
    }
}
