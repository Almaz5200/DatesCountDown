//
//  EditTimerViewController.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import RxSwift
import UIKit

class EditTimerViewController: UIViewController {

    var output: EditTimerViewOutput!
    var countdown: CountDown!

    // MARK: Properties
    private let picker = UIDatePicker()
    private var disposeBag = DisposeBag()
    private var selectedDate = Date().rounded {
        didSet {
            pickDateField.text = selectedDate.toHooman
        }
    }

    @IBOutlet weak var pickDateField: UITextField!
    @IBOutlet weak var timerTitleField: UITextField!
    @IBOutlet weak var saveButton: UIButton!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDateInput()
        setupObservables()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        initialSetup()
    }

    // MARK: Private Methods
    private func initialSetup() {
        selectedDate = countdown.dateEnd
        picker.date = countdown.dateEnd
        timerTitleField.text = countdown.countdownTitle
    }
    private func setupObservables() {
        saveButton.rx.tap
            .subscribe(onNext: { _ in
                self.countdown.countdownTitle = self.timerTitleField.text ?? ""
                self.countdown.dateEnd = self.selectedDate
                self.output.saveTapped(with: self.countdown)
            })
            .disposed(by: disposeBag)
    }
    private func setupDateInput() {
        picker.minimumDate = Date()

        pickDateField.inputView = picker

        picker.rx.date
            .subscribe(onNext: {
                let date = $0.rounded
                self.selectedDate = date
            }).disposed(by: disposeBag)
    }
}

extension EditTimerViewController: EditTimerViewInput {

}
