//
//  MainViewController.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 atrubacheev. All rights reserved.
//

import PinLayout
import RxCocoa
import RxSwift
import UIKit

class MainViewController: BaseViewController {

    var output: MainViewOutput
    private var disposeBag = DisposeBag()

    // MARK: Properties
    var countdowns: [CountDown] = [] {
        didSet {
            placeholder.isHidden = !(countdowns.count == 0)
            tableView.isHidden = countdowns.count == 0
        }
    }

    let tableView = UITableView()
    let placeholder = UILabel().with {
        $0.font = .boldSystemFont(ofSize: 25)
        $0.text = "Oops!\nNo countdowns yet :)"
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }

    init(output: MainViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
        addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false

        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewDidInited()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
    }

    // MARK: Private methods
    private func addSubviews() {
        view.addSubviews([tableView,
                          placeholder])
    }

    private func layout() {
        tableView.pin
            .top(view.pin.safeArea.top)
            .left()
            .right()
            .bottom()
        
        placeholder.pin
            .center()
            .sizeToFit()
    }

    private func setupViews() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)

        addButton.rx.tap
            .subscribe { _ in
                self.output.addButtonTapped()
            }
            .disposed(by: disposeBag)

        navigationItem.setRightBarButton(addButton, animated: true)
    }

}

extension MainViewController: MainViewInput {
    func showCountdowns(list: [CountDown]) {
        countdowns = list
        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countdowns.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(at: indexPath, for: MainCell.self)

        cell.setup(with: countdowns[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let countdown = countdowns[indexPath.row]

        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
            self.output.removeTapped(with: countdown)
            tableView.update {
                tableView.deleteRows(at: [indexPath], with: .right)
                self.countdowns.remove(at: indexPath.row)
            }
        }
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { _, _ in
            self.output.editTapped(with: countdown)
        }
        return [deleteAction, editAction]
    }
}
