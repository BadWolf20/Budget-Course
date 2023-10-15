//
//  TextOngoingView.swift
//  BudgetCourse
//
//  Created by Roman on 14.10.2023.
//

import UIKit
import SnapKit

class TextOngoingView: UIView {
//    ["GTWalsheimPro-Regular", "GTWalsheimPro-Medium", "GTWalsheimPro-Bold"]
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 24)
        label.textAlignment = .center
        return label
    }()

    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 14)

        label.textColor = .systemGray

        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = safeResource(UIColor(named: "MainPink"))
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "GTWalsheimPro-Medium", size: 15)

        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10

        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
     }

     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
     }



    // MARK: - Setup
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 20

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
            make.top.equalToSuperview().inset(35)
            make.height.equalTo(28)

            make.centerX.equalToSuperview()
        }

        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(18)
            make.height.equalTo(46)

            make.left.right.equalToSuperview().inset(29)
        }

        button.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(50)
            make.left.right.equalToSuperview().inset(45)
            make.height.equalTo(48)
            make.bottom.equalToSuperview().inset(50)
        }
    }

    // MARK: - Actions

    @objc private func buttonTapped() {
        print("Tapped!")
    }

}
