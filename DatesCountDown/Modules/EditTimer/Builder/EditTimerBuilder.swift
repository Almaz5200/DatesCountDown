//
//  EditTimerBuilder.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import Foundation
import UIKit

class EditTimerBuilder {
    static func build() -> EditTimerViewController {
        let storyboard = UIStoryboard(name: "EditTimer", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? EditTimerViewController else {
            fatalError("Couldn't init EditTimer")
        }

		let router = EditTimerRouter()

        let presenter = EditTimerPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = EditTimerInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        router.viewController = viewController

		return viewController
     }
}
