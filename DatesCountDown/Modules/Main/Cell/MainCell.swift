//
//  MainCell.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 14/04/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    let countdownLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 24)
        $0.textAlignment = .center
    }
    let countdownTitle: UILabel! = UILabel().with {
        $0.font = .systemFont(ofSize: 17)
        $0.textAlignment = .center
    }

    public var countdown: CountDown!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setup(with countdown: CountDown) {
        self.countdown = countdown

        updateLabel()

        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [ unowned self ] _ in
            self.updateLabel()
        }

        countdownTitle.text = countdown.countdownTitle

    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layout()

        return CGSize(width: window?.frame.width ?? 0, height: countdownTitle.frame.maxY + 16)
    }

    private func layout() {
        countdownLabel.pin
            .top(26)
            .left(16)
            .right(16)
            .height(29)

        countdownTitle.pin
            .below(of: countdownLabel)
            .marginTop(22)
            .left(16)
            .right(16)
            .height(21)
    }

    private func addSubviews() {
        addSubviews([countdownLabel,
                     countdownTitle])
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
