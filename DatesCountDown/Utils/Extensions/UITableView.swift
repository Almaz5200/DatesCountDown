//
//  UITableView.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 02/05/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import UIKit

extension UITableView {
    func update(_ update: (() -> Void)) {
        beginUpdates()
        update()
        endUpdates()
    }

    /// Get cell of given class for indexPath
    ///
    /// - parameter indexPath: the indexPath
    /// - parameter cellClass: a cell class
    ///
    /// - returns: a reusable cell
    ///
    func cell<T: UITableViewCell>(at indexPath: IndexPath, for cellClass: T.Type) -> T {
        let reuseIdentifier = String(describing: cellClass)

        if let cell = self.dequeueReusableCell(withIdentifier: reuseIdentifier) {
            // swiftlint:disable force_cast
            return cell as! T
            // swiftlint:enable force_cast
        } else {
            if Bundle.main.path(forResource: reuseIdentifier, ofType: "nib") != nil {
                register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
            } else {
                register(cellClass, forCellReuseIdentifier: reuseIdentifier)
            }
        }

        return cell(at: indexPath, for: cellClass)
    }
}
