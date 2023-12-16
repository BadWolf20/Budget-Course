//
//  PinkView.swift
//  BudgetCourse
//
//  Created by Roman on 18.11.2023.
//

import UIKit

class PinkView: UIView {

    // MARK: - Properties open

    var titleText: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }

    var secondaryText: String? {
        get { return secondaryLabel.text }
        set { secondaryLabel.text = newValue }
    }

    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }


    // MARK: - Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.fromAsset(.whiteMain)
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

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
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
        layer.cornerRadius = 20

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
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(25)
        }

        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(Metric.titleLabelHeight)
            make.top.equalTo(secondaryLabel.snp.bottom).offset(8)
            make.left.equalTo(secondaryLabel.snp.left)
            make.bottom.equalToSuperview().inset(22)
        }

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-8)
            make.left.equalTo(titleLabel.snp.right).offset(12)
            make.bottom.equalTo(titleLabel.snp.bottom)
        }

    }
}

extension PinkView{
    /// Предоставляет метрики и константы, используемые в макете и дизайне UI `RemainProgressView`.
    enum Metric {
        static let titleLabelHeight: CGFloat = 24
        static let secondaryLabelHeight: CGFloat = 14
    }

    /// Содержит конфигурации шрифтов для различных меток в `RemainProgressView`.
    enum Font {
        static let titleLabel: UIFont = AppFont.walsheimProBold.size(21)
        static let secondaryLabel: UIFont = AppFont.walsheimProRegular.size(12)
    }
}
