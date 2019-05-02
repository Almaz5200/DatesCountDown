//
//  MainBuilder.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import Foundation
import UIKit

class MainBuilder {
    static func build() -> MainViewController {
        let viewController = MainViewController()

		let router = MainRouter()

        let presenter = MainPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MainInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        router.viewController = viewController

		return viewController
     }

}
