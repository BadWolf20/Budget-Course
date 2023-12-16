//
//  SettingTableViewCell.swift
//  BudgetCourse
//
//  Created by Roman on 18.11.2023.
//

import UIKit

/**
 `SettingTableViewCell` - это кастомная ячейка `UITableViewCell`, предназначенная для использования в настройках приложения. Эта ячейка включает в себя иконку, основной и дополнительный текстовые метки, метку справа и переключатель, что делает её универсальной для различных типов настроек.

 ### Основные свойства:
 - `switchAction`: Замыкание, вызываемое при изменении состояния переключателя.

 ### Компоненты:
 - `iconImage`: `UIImageView` для отображения иконки.
 - `titleLabel`: `UILabel` для отображения основного текста.
 - `secondaryLabel`: `UILabel` для отображения второстепенного текста.
 - `rightLabel`: `UILabel`, отображаемый с правой стороны, для дополнительной информации.
 - `rightSwitch`: `UISwitch` для включения или выключения настройки.

 ### Инициализаторы:
 - `init(style:reuseIdentifier:)`: Инициализирует ячейку с заданным стилем и идентификатором для повторного использования.
 - `init?(coder:)`: Не реализован и вызывает ошибку времени выполнения при использовании.

 ### Жизненный цикл:
 - `setSelected(_:animated:)`: Вызывается при выборе ячейки.

 ### Конфигурация:
 - `configure(with:)`: Настраивает ячейку, используя предоставленные данные о настройках.

 ### Настройка интерфейса:
 - `setupUI()`: Настройка иерархии, ограничений и компонентов ячейки.
 - `setupHierarchy()`: Добавляет иконку, текстовые метки и переключатель в иерархию представлений.
 - `setupConstraints()`: Устанавливает ограничения для компонентов.

 ### Действия:
 - `switchChanged()`: Вызывается при изменении состояния переключателя.

 ### Пример использования:
 ```swift
 let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.reuseIdentifier, for: indexPath) as! SettingTableViewCell
 cell.configure(with: settingsData)
 cell.switchAction = { isOn in
     // Обработка изменения состояния переключателя
 }
 ```
 */
class SettingTableViewCell: UITableViewCell, Reusable {

    // MARK: - Properties
    /// Замыкание, вызываемое при изменении состояния переключателя.
    var switchAction: ((Bool) -> Void)?

    // MARK: - Components
    /// `iconImage` - основная иконка.
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.5

        return imageView
    }()

    /// `titleLabel` - основная текстовая метка.
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.fromAsset(.textMain)
        label.font = Font.titleLabel
        label.numberOfLines = 1
        return label
    }()

    /// `secondaryLabel` - второстепенная текстовая метка.
    private lazy var secondaryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.fromAsset(.textSecondary)
        label.font = Font.secondaryLabel
        label.numberOfLines = 1
        return label
    }()

    /// `secondaryLabel` - правая текстовая метка для отображение текста на месте переключателя.
    private lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.fromAsset(.textSecondary)
        label.font = Font.rightLabel
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()

    /// `secondaryLabel` - переключатель.
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
            make.left.equalToSuperview().inset(Metric.leftIndent)
            make.height.equalTo(Metric.iconImageHeight)
            make.width.equalTo(iconImage.snp.height)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.top)
            make.height.equalTo(Metric.titleLabelHeight)
            make.left.equalTo(iconImage.snp.right).offset(Metric.leftIndent)
        }

        secondaryLabel.snp.makeConstraints { make in
            make.bottom.equalTo(iconImage.snp.bottom)
            make.height.equalTo(Metric.secondaryLabelHeight)
            make.left.equalTo(titleLabel.snp.left)
        }

        rightSwitch.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(Metric.rightIndent)
        }

        rightLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.bottom)
            make.right.equalToSuperview().inset(Metric.rightIndent)
            make.height.equalTo(Metric.rightLabelHeight)
        }
    }

    // MARK: - Actions
    /// Вызывается при изменении состояния переключателя.
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
        static let leftIndent: CGFloat = 20
        static let rightIndent: CGFloat = 26
    }

    /// Содержит конфигурации шрифтов для различных меток в `SettingTableViewCell`.
    enum Font {
        static let titleLabel: UIFont = AppFont.walsheimProBold.size(18)
        static let secondaryLabel: UIFont = AppFont.walsheimProRegular.size(12)
        static let rightLabel: UIFont = AppFont.walsheimProRegular.size(12)
    }
}
