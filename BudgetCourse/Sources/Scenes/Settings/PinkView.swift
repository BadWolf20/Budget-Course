//
//  PinkView.swift
//  BudgetCourse
//
//  Created by Roman on 18.11.2023.
//

import UIKit


/**
 `PinkView` -  это пользовательское представление, предназначенное для отображения изображения вместе с основным и второстепенным текстовыми метками. Оно включает в себя заголовок, подзаголовок и изображение, с возможностью настройки каждого из этих элементов. Служит для привлечения внимания к в качестве карточек или баннеров.

 ### Основные свойства:
 - `titleText`: Текст заголовка, отображаемый в `titleLabel`.
 - `secondaryText`: Дополнительный текст, отображаемый в `secondaryLabel`.
 - `image`: Изображение, отображаемое в `imageView`.

 ### Компоненты:
 - `titleLabel`: `UILabel` для отображения заголовка.
 - `secondaryLabel`: `UILabel` для отображения подзаголовка.
 - `imageView`: `UIImageView` для отображения изображения.

 ### Инициализаторы:
 - `init(frame:)`: Инициализирует и настраивает представление с заданным рамочным размером.
 - `init?(coder:)`: Используется для инициализации из storyboard или XIB.

 ### Настройка интерфейса:
 - `setupUI()`: Настройка иерархии, ограничений и компонентов представления.
 - `setupHierarchy()`: Добавляет `titleLabel`, `secondaryLabel` и `imageView` в иерархию представления.
 - `setupConstraints()`: Определяет ограничения для компонентов представления.
 - `setupComponents()`: Настройка стиля и внешнего вида представления, включая фон и тень.

 ### Пример:
 ```swift
 let pinkView = PinkView()
 pinkView.titleText = "Заголовок"
 pinkView.secondaryText = "Подзаголовок"
 pinkView.image = UIImage(named: "exampleImage")
 ```
 */
class PinkView: UIView {

    // MARK: - Properties open
    /// Текст для основной метки.
    var titleText: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }

    /// Текст для второстепенной метки.
    var secondaryText: String? {
        get { return secondaryLabel.text }
        set { secondaryLabel.text = newValue }
    }

    /// Изображение для отображения в `imageView`.
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }

    // MARK: - Components
    /// `titleLabel` - основная текстовая метка.
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.fromAsset(.whiteMain)
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

    /// `imageView` - компонент для отображения изображения.
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()


    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - Setup
    private func setupUI() {
        setupHierarchy()
        setupConstraints()
        setupComponents()
    }

    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(secondaryLabel)
        addSubview(imageView)
    }

    private func setupComponents() {
        backgroundColor = UIColor.fromAsset(.mainPink)
        layer.cornerRadius = Metric.cornerRadius

        // Настройка тени
        // Цвет тени
        layer.shadowColor = UIColor.fromAsset(.mainPink).withAlphaComponent(0.5).cgColor

        // Прозрачность тени
        layer.shadowOpacity = 1
        // Смещение тени относительно view
        layer.shadowOffset = CGSize(width: 0, height: 5)
        // Радиус размытия тени
        layer.shadowRadius = 10

        // Растрирование для лучшей производительности.
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }

    private func setupConstraints() {
        secondaryLabel.snp.makeConstraints { make in
            make.height.equalTo(Metric.secondaryLabelHeight)
            make.top.equalToSuperview().inset(Metric.secondaryLabelTopIndent)
            make.left.equalToSuperview().inset(Metric.secondaryLabelLeftIndent)
        }

        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(Metric.titleLabelHeight)
            make.top.equalTo(secondaryLabel.snp.bottom).offset(Metric.titleLabelTopIndent)
            make.left.equalTo(secondaryLabel.snp.left)
            make.bottom.equalToSuperview().inset(Metric.titleLabelbottomIndent)
        }

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-Metric.titleLabelTopIndent)
            make.left.equalTo(titleLabel.snp.right).offset(Metric.imageViewLeftIndent)
            make.bottom.equalTo(titleLabel.snp.bottom)
        }
    }
}

extension PinkView {
    /// Предоставляет метрики и константы, используемые в макете и дизайне UI `PinkView`.
    enum Metric {
        static let titleLabelHeight: CGFloat = 24
        static let secondaryLabelHeight: CGFloat = 14
        static let cornerRadius: CGFloat = 20
        static let secondaryLabelTopIndent: CGFloat = 20
        static let secondaryLabelLeftIndent: CGFloat = 25
        static let titleLabelbottomIndent: CGFloat = 22
        static let titleLabelTopIndent: CGFloat = 8
        static let imageViewLeftIndent: CGFloat = 12
    }

    /// Содержит конфигурации шрифтов для различных меток в `PinkView`.
    enum Font {
        static let titleLabel: UIFont = AppFont.walsheimProBold.size(21)
        static let secondaryLabel: UIFont = AppFont.walsheimProRegular.size(12)
    }
}
