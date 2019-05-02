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
    @IBOutlet weak var countdownTitle: UILabel!

    public var countdown: CountDown!

    public func setup(with countdown: CountDown) {
        self.countdown = countdown

        updateLabel()

        let queue = DispatchQueue.global(qos: .default)

        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [ unowned self ] _ in
            self.updateLabel()
        }

        countdownTitle.text = countdown.countdownTitle

    }

    private func updateLabel() {
        if countdown.dateEnd > Date() {
            self.countdownLabel.text = countdown.dateEnd
                .timeIntervalSinceNow.format(using: [.day, .hour, .minute, .second])
        } else {
            self.countdownLabel.text = countdown.dateEnd
                .timeIntervalSinceNow.format(using: [.day, .hour, .minute, .second]) + " ago"
        }
    }
}
