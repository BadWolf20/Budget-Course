//
//  OngoingViewController.swift
//  BudgetCourse
//
//  Created by Roman on 14.10.2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    private lazy var textView: TextOnboardingView = {
        let view = TextOnboardingView()

        return view
    }()

    private lazy var imageView: UIImageView = {
        let imgView = UIImageView(image: safeResource(UIImage(named: "Onbording1")))
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    private lazy var pageControl: UIPageControl = {
        let contr = UIPageControl()
        contr.numberOfPages = 3
        contr.currentPage = 0
        contr.pageIndicatorTintColor = .systemGray6
        contr.currentPageIndicatorTintColor = safeResource(UIColor(named: "MainPink"))
        contr.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        return contr
    }()

    // MARK: - Properties



    // MARK: - Components






    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupHierarchy()
        setupConstraints()
        setupComponents()
        setupText()
    }

    private func setupHierarchy() {
        view.addSubview(textView)
        view.addSubview(imageView)
        view.addSubview(pageControl)
    }

    private func setupComponents() {

    }

    private func setupText() {

    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.right.left.equalToSuperview().inset(70)

            make.height.equalTo(230)

            make.top.equalToSuperview().inset(140).priority(.low)
            make.top.greaterThanOrEqualTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            make.top.lessThanOrEqualToSuperview().inset(140)

            make.bottom.lessThanOrEqualTo(pageControl.snp.top).offset(-10)

        }

        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()

            make.height.equalTo(40)

            make.bottom.equalTo(textView.snp.top).offset(-35).priority(.low)
            make.bottom.greaterThanOrEqualTo(textView.snp.top).offset(-35)
            make.bottom.lessThanOrEqualTo(textView.snp.top).offset(-5)
        }

        textView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(31)
            make.right.left.equalToSuperview().inset(15)
        }

    }

    // MARK: - Update



    // MARK: - Actions
    @objc func pageControlTapped(_ sender: UIPageControl) {
        print("Move pageControl to \(sender.currentPage)")
    }


    // MARK: - Functions



}
