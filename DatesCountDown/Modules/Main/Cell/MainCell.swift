//
//  MainCell.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 14/04/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var countdownLabel: UILabel!

    public func setup(with countdown: CountDown) {
        countdownLabel.text = countdown.dateEnd.description
    }
}
