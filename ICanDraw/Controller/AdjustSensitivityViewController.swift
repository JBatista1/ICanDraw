//
//  AdjustSensitivityViewController.swift
//  ICanDraw
//
//  Created by Joao Batista on 07/01/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit

class AdjustSensitivityViewController: UIViewController {
    let customView = AdjustSensitivity(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        view = customView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
