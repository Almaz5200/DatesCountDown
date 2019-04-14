//
//  CountDownCell.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import UIKit

class CountDownCell: UITableViewCell {

    @IBOutlet weak var countdownTitleLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
