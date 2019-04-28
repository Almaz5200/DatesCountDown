//
//  CreateTimerRouter.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import UIKit

class CreateTimerRouter {
	var viewController: UIViewController!
}

extension CreateTimerRouter: CreateTimerRouterInput {

    func popBack() {
        viewController.navigationController?.popViewController(animated: true)
    }

}
