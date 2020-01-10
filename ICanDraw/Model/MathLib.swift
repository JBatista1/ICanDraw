//
//  MathLib.swift
//  ICanDraw
//
//  Created by Joao Batista on 07/01/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

struct MathLib {
    func normalize(value: CGFloat, decimalValue: CGFloat) -> CGFloat {
           let normalizeValue = floor(decimalValue * value)
           let newValue = CGFloat(normalizeValue / decimalValue)
           return newValue
       }
}
