//
//  MainRouter.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import UIKit

class MainRouter {
	var viewController: UIViewController!
}

extension MainRouter: MainRouterInput {
    func showTimerCreation() {
        let vc = CreateTimerBuilder.build()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }

    func showTimerEditing() {

    }
}
