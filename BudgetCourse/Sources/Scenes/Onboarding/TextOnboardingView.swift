//
//  TextOngoingView.swift
//  BudgetCourse
//
//  Created by Roman on 14.10.2023.
//

import UIKit
import SnapKit

/**
 `TextOnboardingView` - это пользовательское представление, используемое для оформления экрана онбординга. Оно включает в себя заголовок, подзаголовок и кнопку, и предназначено для привлечения внимания пользователя и предоставления информации.

 ### Компоненты:
 - `titleLabel`: `UILabel` для отображения заголовка.
 - `secondaryLabel`: `UILabel` для отображения дополнительного текста.
 - `button`: `UIButton` для выполнения действия.

 ### Инициализаторы:
 - `init(frame:)`: Инициализирует представление с заданным размером.
 - `init?(coder:)`: Не используется в данном контексте и вызывает ошибку времени выполнения.

 ### Настройка интерфейса:
 - `setupUI()`: Настройка компонентов представления.
 - `setupHierarchy()`: Добавляет компоненты в иерархию представления.
 - `setupConstraints()`: Настраивает ограничения компонентов.
 - `setupComponents()`: Настраивает визуальные свойства компонентов, включая фон и тени.
 - `setupText()`: Устанавливает начальные текстовые значения для компонентов.

 ### Действия:
 - `buttonTapped()`: Вызывается при нажатии на кнопку.

 ### Пример использования:
 ```swift
 let onboardingView = TextOnboardingView()
 onboardingView.titleLabel.text = "Добро пожаловать"
 onboardingView.secondaryLabel.text = "Узнайте больше о приложении"
 onboardingView.button.setTitle("Начать", for: .normal)
 ```
 */
class TextOnboardingView: UIView {

    // MARK: - Components
    /// `titleLabel` - основная текстовая метка.
    private lazy var titleLabel: UILabel = {
        let label = UILabel()

        label.textAlignment = .center
        label.font = Font.firstLabel
        label.textColor = safeResource(UIColor(named: "TextMain"))

        return label
    }()

    /// `secondaryLabel` - второстепенная текстовая метка.
    private lazy var secondaryLabel: UILabel = {
        let label = UILabel()

        label.textAlignment = .center
        label.font = Font.secondaryLabel
        label.textColor = safeResource(UIColor(named: "TextSecondary"))

        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        return label
    }()

    /// `button` - кнопка.
    private lazy var button: UIButton = {
        let btn = UIButton(type: .system)

        btn.titleLabel?.font = Font.button
        btn.setTitleColor(safeResource(UIColor(named: "WhiteMain")), for: .normal)
        btn.backgroundColor = safeResource(UIColor(named: "MainPink"))

        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10

        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        return btn
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
     }

     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
     }


    // MARK: - Setup
    private func setupUI() {
        setupHierarchy()
        setupConstraints()
        setupComponents()
        setupText()
    }

    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(secondaryLabel)
        addSubview(button)
    }

    private func setupComponents() {
        // View
        backgroundColor = .systemBackground
        layer.cornerRadius = Metric.cornerRadius
        // Настройка тени
        // Цвет тени
        layer.shadowColor = UIColor.systemGray.withAlphaComponent(0.2).cgColor

        // Прозрачность тени
        layer.shadowOpacity = 1
        // Смещение тени относительно view
        layer.shadowOffset = CGSize(width: 0, height: 12)
        // Радиус размытия тени
        layer.shadowRadius = 36

        // Растрирование для лучшей производительности.
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }

    private func setupText() {
        titleLabel.text = "Keytar sweenet"
        secondaryLabel.text = "Portland ugh fashion axe Helvetica. Echo Park Austin gastropub roof party."
        button.setTitle("I'm interested", for: .normal)
    }

    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            // Добавить левое и правое ограничения
            make.height.equalTo(Metric.titleLabelHeight)
            make.top.equalToSuperview().inset(Metric.titleLabelTopIndent)
        }

        secondaryLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Metric.secondaryLabelLeftIndent)
            make.height.equalTo(Metric.secondaryLabelHeight)
            make.top.equalTo(titleLabel.snp.bottom).offset(Metric.secondaryLabelTopIndent)
        }

        button.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Metric.buttonLeftIndent)

            make.height.equalTo(Metric.buttonHeight)
            make.top.equalTo(secondaryLabel.snp.bottom).offset(Metric.buttonBottomTopIndent)
            make.bottom.equalToSuperview().inset(Metric.buttonBottomTopIndent)
        }
    }

    // MARK: - Actions
    /// Обрабатывает нажатие на кнопку.
    @objc private func buttonTapped() {
        print("Tapped!")
    }

}

extension TextOnboardingView {
    /// Предоставляет метрики и константы, используемые в макете и дизайне UI `TextOnboardingView`.
    enum Metric {

        static let titleLabelHeight: CGFloat = 28
        static let secondaryLabelHeight: CGFloat = 46
        static let cornerRadius: CGFloat = 20
        static let buttonHeight: CGFloat = 48

        static let titleLabelTopIndent: CGFloat = 35
        static let secondaryLabelTopIndent: CGFloat = 18
        static let secondaryLabelLeftIndent: CGFloat = 29
        static let buttonLeftIndent: CGFloat = 45
        static let buttonBottomTopIndent: CGFloat = 50
    }

    /// Содержит конфигурации шрифтов для различных меток в `TextOnboardingView`.
    enum Font {
        static let firstLabel: UIFont = AppFont.walsheimProBold.size(24)
        static let secondaryLabel: UIFont = AppFont.walsheimProRegular.size(14)
        static let button: UIFont = AppFont.walsheimProMedium.size(15)
    }
}
