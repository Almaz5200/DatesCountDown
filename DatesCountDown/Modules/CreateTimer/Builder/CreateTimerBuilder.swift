//
//  CreateTimerBuilder.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import Foundation
import UIKit

class CreateTimerBuilder {
    static func build() -> CreateTimerViewController {
        guard let viewController = R.storyboard.createTimer.instantiateInitialViewController() else {
            fatalError("\(String(describing: self)) Couldn't be inited")
        }

		let router = CreateTimerRouter()

        let presenter = CreateTimerPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CreateTimerInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        router.viewController = viewController

		return viewController
     }
}
