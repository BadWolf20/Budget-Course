//
//  SettingTableViewCell.swift
//  BudgetCourse
//
//  Created by Roman on 18.11.2023.
//

import UIKit

class SettingTableViewCell: UITableViewCell, Reusable {

    // MARK: - Properties
    var switchAction: ((Bool) -> Void)?

    // MARK: - Components
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.5

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.fromAsset(.textMain)
        label.font = Font.titleLabel
        label.numberOfLines = 1
        return label
    }()

    private lazy var secondaryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.fromAsset(.textSecondary)
        label.font = Font.secondaryLabel
        label.numberOfLines = 1
        return label
    }()

    private lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.fromAsset(.textSecondary)
        label.font = Font.rightLabel
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()

    private lazy var rightSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        return toggle
    }()

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Configuration
    func configure(with data: Settings) {
        titleLabel.text = data.title
        secondaryLabel.text = data.secondaryLabel
        iconImage.image = UIImage.circleImageWithAssetImage(named: data.imageName, backgroundColor: .systemGray4, diameter: 48, imageScale: 0.5)

        if let switchValue = data.switchValue {
            rightSwitch.isHidden = false
            rightSwitch.isOn = switchValue
        }

        if let rightText = data.rightText {
            rightLabel.isHidden = false
            rightLabel.text = rightText
        }
    }


    // MARK: - Setup
    private func setupUI() {
        setupHierarchy()
        setupConstraints()
        setupComponents()
    }

    private func setupHierarchy() {
        contentView.addSubview(iconImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(rightSwitch)
        contentView.addSubview(rightLabel)
        contentView.addSubview(secondaryLabel)
    }

    private func setupComponents() {
        rightSwitch.isHidden = true
        rightLabel.isHidden = true
        backgroundColor = .clear
    }

    private func setupConstraints() {
        iconImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(Metric.iconImageHeight)
            make.width.equalTo(iconImage.snp.height)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.top)
            make.height.equalTo(Metric.titleLabelHeight)
            make.left.equalTo(iconImage.snp.right).offset(20)
        }

        secondaryLabel.snp.makeConstraints { make in
            make.bottom.equalTo(iconImage.snp.bottom)
            make.height.equalTo(Metric.secondaryLabelHeight)
            make.left.equalTo(titleLabel.snp.left)
        }


        rightSwitch.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(26)
        }

        rightLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.bottom)
            make.right.equalToSuperview().inset(26)
            make.height.equalTo(Metric.rightLabelHeight)
        }
    }

    // MARK: - Actions
    @objc private func switchChanged() {
        switchAction?(rightSwitch.isOn)
    }

}

extension SettingTableViewCell {

    /// Предоставляет метрики и константы, используемые в макете и дизайне UI `SettingTableViewCell`.
    enum Metric {
        static let titleLabelHeight: CGFloat = 20
        static let secondaryLabelHeight: CGFloat = 14
        static let iconImageHeight: CGFloat = 48
        static let rightLabelHeight: CGFloat = 24


    }

    /// Содержит конфигурации шрифтов для различных меток в `SettingTableViewCell`.
    enum Font {
        static let titleLabel: UIFont = AppFont.walsheimProBold.size(18)
        static let secondaryLabel: UIFont = AppFont.walsheimProRegular.size(12)
        static let rightLabel: UIFont = AppFont.walsheimProRegular.size(12)

    }
}
