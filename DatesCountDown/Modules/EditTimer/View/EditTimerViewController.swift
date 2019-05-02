//
//  EditTimerViewController.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 24/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import RxSwift
import UIKit

class EditTimerViewController: BaseViewController {

    var output: EditTimerViewOutput!
    var countdown: CountDown

    // MARK: Properties
    private let picker = UIDatePicker()
    private var disposeBag = DisposeBag()
    private var selectedDate = Date().rounded {
        didSet {
            pickDateField.text = selectedDate.toHooman
        }
    }

    // MARK: UI Elements
    let createTimerLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 30, weight: UIFont.Weight.thin)
        $0.text = "Измените таймер"
        $0.textAlignment = .center
    }
    let pickDateField = UITextField().with {
        $0.font = .systemFont(ofSize: 20)
        $0.placeholder = "Выберите дату"
        $0.textAlignment = .center
    }
    let timerTitleField = UITextField().with {
        $0.font = .systemFont(ofSize: 20)
        $0.placeholder = "Назовите таймер"
        $0.textAlignment = .center
    }
    let saveButton = UIButton().with {
        $0.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.862745098, blue: 0.2470588235, alpha: 1)
        $0.titleLabel?.font = .systemFont(ofSize: 21, weight: UIFont.Weight.heavy)
        $0.titleLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        $0.setTitle("Save", for: .normal)
        $0.layer.cornerRadius = 16
    }

    init(countdown: CountDown) {
        self.countdown = countdown

        super.init(nibName: nil, bundle: nil)

        addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupDateInput()
        setupObservables()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        initialSetup()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayout()
    }

    // MARK: Private Methods
    private func setupLayout() {
        createTimerLabel.pin
            .height(36)
            .top(view.pin.safeArea.top + 16)
            .left(16)
            .right(16)

        pickDateField.pin
            .height(24)
            .below(of: createTimerLabel)
            .marginTop(16)
            .left(16)
            .right(16)

        timerTitleField.pin
            .height(24)
            .below(of: pickDateField)
            .marginTop(16)
            .left(16)
            .right(16)

        saveButton.pin
            .height(100)
            .below(of: timerTitleField)
            .marginTop(16)
            .left(16)
            .right(16)
    }

    private func addSubviews() {
        view.addSubviews([createTimerLabel,
                          pickDateField,
                          timerTitleField,
                          saveButton])
    }

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
