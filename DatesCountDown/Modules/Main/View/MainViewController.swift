//
//  MainViewController.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var output: MainViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController: MainViewInput {
    func showCountdowns(list: [CountDown]) {

    }
}
