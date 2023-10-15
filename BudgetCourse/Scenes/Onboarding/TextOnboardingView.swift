//
//  TextOngoingView.swift
//  BudgetCourse
//
//  Created by Roman on 14.10.2023.
//

import UIKit
import SnapKit

class TextOnboardingView: UIView {

    // MARK: - Components
    private lazy var firstLabel: UILabel = {
        let label = UILabel()

        label.textAlignment = .center
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 24)
        label.textColor = safeResource(UIColor(named: "TextMain"))

        return label
    }()

    private lazy var secondLabel: UILabel = {
        let label = UILabel()

        label.textAlignment = .center
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 14)
        label.textColor = safeResource(UIColor(named: "TextSecondary"))

        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        return label
    }()

    private lazy var button: UIButton = {
        let btn = UIButton(type: .system)

        btn.titleLabel?.font = UIFont(name: "GTWalsheimPro-Medium", size: 15)
        btn.setTitleColor(safeResource(UIColor(named: "White")), for: .normal)
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
        addSubview(firstLabel)
        addSubview(secondLabel)
        addSubview(button)
    }

    private func setupComponents() {
        // View
        backgroundColor = .white
        layer.cornerRadius = 20
        // Настройка тени
        // Цвет тени
        layer.shadowColor = UIColor.black.withAlphaComponent(0.07).cgColor
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
        firstLabel.text = "Keytar sweenet"
        secondLabel.text = "Portland ugh fashion axe Helvetica. Echo Park Austin gastropub roof party."
        button.setTitle("I'm interested", for: .normal)

    }

    private func setupConstraints() {
        firstLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()

            make.height.equalTo(28)
            make.top.equalToSuperview().inset(35)
        }

        secondLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(29)

            make.height.equalTo(46)
            make.top.equalTo(firstLabel.snp.bottom).offset(18)
        }

        button.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(45)

            make.height.equalTo(48)
            make.top.equalTo(secondLabel.snp.bottom).offset(50)
            make.bottom.equalToSuperview().inset(50)
        }
    }

    // MARK: - Actions

    @objc private func buttonTapped() {
        print("Tapped!")
    }

}
