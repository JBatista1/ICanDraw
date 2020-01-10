//
//  Sequence+Sum.swift
//  ICanDraw
//
//  Created by Joao Batista on 10/01/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(.zero, +) }
}
