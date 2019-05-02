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
		let router = MainRouter()

        let interactor = MainInteractor()
        let presenter = MainPresenter(interactor: interactor)
        let viewController = MainViewController(output: presenter)

        presenter.view = viewController
        presenter.router = router
        interactor.output = presenter

        router.viewController = viewController

		return viewController
     }

}
