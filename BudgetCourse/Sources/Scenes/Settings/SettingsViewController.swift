//
//  SettingsViewController.swift
//  BudgetCourse
//
//  Created by Roman on 18.11.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK: - Properties
    

    // MARK: - Components

    private lazy var pinkView = PinkView()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)

        // Cell registering
        tableView.register(cellType: SettingTableViewCell.self)
        tableView.backgroundColor = .clear
        tableView.frame = CGRect.init(origin: .zero, size: view.frame.size)
        tableView.rowHeight = 80
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 92, bottom: 0, right: 26)

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    // MARK: - Setup
    private func setupUI() {
        setupHierarchy()
        setupConstraints()
        setupComponents()
        setupText()
    }

    private func setupHierarchy() {
        view.addSubview(pinkView)
        view.addSubview(tableView)
    }

    private func setupComponents() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground



    }

    private func setupText() {
        self.title = "Settings"
        pinkView.titleText = "Turn on notification"
        pinkView.secondaryText = "Update your settings"
        pinkView.image = UIImage.fromAsset(.bell)

    }

    private func setupConstraints() {
        pinkView.snp.remakeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.left.equalTo(view.safeAreaLayoutGuide).inset(25)
        }
        tableView.snp.remakeConstraints { make in
            make.top.equalTo(pinkView.snp.bottom)
            make.bottom.left.right.equalTo(view.safeAreaLayoutGuide)
        }
    }

    // MARK: - Actions
    // Обработка переключения свитча
    @objc private func tog(_ toggle: UISwitch) {
    }


    // MARK: - Functions
    // Переход к экрану настроек на основе выбранной строки
    private func moveToSetttingView(_ pageName: String) {
        switch pageName {
        case "":
            print (pageName)
        default:
            print("No page")
        }
    }

}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: SettingTableViewCell = tableView.dequeueReusableCell(for: indexPath, cellType: SettingTableViewCell.self)
        cell.configure(with: settingsData[indexPath.row])

        return cell
    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if settingsData[indexPath.row].switchValue != nil {
            return nil
        }

        return indexPath
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)


        // Обработка выбора настройки

        // Переход к экрану настроек
        moveToSetttingView(settingsData[indexPath.row].title)
    }
}
