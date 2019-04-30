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
        self.countdownLabel.text = countdown.dateEnd
            .timeIntervalSinceNow.format(using: [.day, .hour, .minute, .second])
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [ unowned self ] _ in
            self.countdownLabel.text = countdown.dateEnd
                .timeIntervalSinceNow.format(using: [.day, .hour, .minute, .second])
        }
    }
}
