//
//  EditTimerRouter.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import UIKit

class EditTimerRouter {
	var viewController: UIViewController!
}

extension EditTimerRouter: EditTimerRouterInput {
    func returnToRoot() {
        viewController.navigationController?.popViewController(animated: true)
    }
}
