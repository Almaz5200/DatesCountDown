//
//  CreateTimerViewController.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class CreateTimerViewController: UIViewController {

    @IBOutlet weak var pickDateField: UITextField!
    @IBOutlet weak var timerTitleField: UITextField!
    @IBOutlet weak var createButton: UIButton!

    var output: CreateTimerViewOutput!

    // MARK: Properties
    private var selectedDate = Date()
    private let disposeBag = DisposeBag()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupObvervables()
        setupPicker()
    }

    // MARK: Private methods
    private func setupObvervables() {
        createButton.rx.tap
            .subscribe(onNext: { _ in
                self.output.createButtonTappedWith(name: self.timerTitleField.text ?? "", date: self.selectedDate)
            })
            .disposed(by: disposeBag)
    }

    private func setupPicker() {
        let picker = UIDatePicker()
        picker.minimumDate = Date()

        pickDateField.inputView = picker

        picker.rx.date
            .subscribe(onNext: {
                self.selectedDate = $0
                self.pickDateField.text = $0.toHooman
            }).disposed(by: disposeBag)
    }
}

extension CreateTimerViewController: CreateTimerViewInput {
}
