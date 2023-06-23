//
//  MaleAvatarViewController.swift
//  Nick_Tsaruk_Homework_7
//
//  Created by Tsaruk Nick on 18.06.23.
//

import UIKit

class MaleAvatarViewController: UIViewController {

    let viewTitle = UILabel()
    let iconStackView = UIStackView()
    let firstLineStackView = UIStackView()
    let secondLineStackView = UIStackView()
    
    var maleAvatarDelegate: AccountDelegate?
    var config = AccountConfig(nickName: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let tempConfig = maleAvatarDelegate?.config else { return }
        config = tempConfig
        
        view.backgroundColor = .white
        setupViewTitle()
        setupIconStackView()
        setupFirstLineStackView()
        setupSecondLineStackView()
        
        let antButton = RoundedButton(title: "",image: Logos.MaleLogo.ant, border: false, filled: false)
        antButton.tag = 0
        let personButton = RoundedButton(title: "",image: Logos.MaleLogo.person, border: false, filled: false)
        personButton.tag = 1
        let crownButton = RoundedButton(title: "",image: Logos.MaleLogo.crown, border: false, filled: false)
        crownButton.tag = 2
        let starButton = RoundedButton(title: "",image: Logos.MaleLogo.star, border: false, filled: false)
        starButton.tag = 3
        
        firstLineStackView.addArrangedSubview(antButton)
        firstLineStackView.addArrangedSubview(personButton)
        secondLineStackView.addArrangedSubview(crownButton)
        secondLineStackView.addArrangedSubview(starButton)
        
        antButton.addTarget(self, action: #selector(avatarButtonTapped(_:)), for: .touchUpInside)
        personButton.addTarget(self, action: #selector(avatarButtonTapped(_:)), for: .touchUpInside)
        crownButton.addTarget(self, action: #selector(avatarButtonTapped(_:)), for: .touchUpInside)
        starButton.addTarget(self, action: #selector(avatarButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func avatarButtonTapped(_ sender: UIButton) {
        config.avatarImg = sender.currentImage
        maleAvatarDelegate?.saveAccountConfig(config)
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupViewTitle() {
        viewTitle.text = "Choose avatar"
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewTitle)
        NSLayoutConstraint.activate([
            viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: UIVariables.titleTopPadding)
        ])
    }
    func setupIconStackView() {
        iconStackView.axis = .vertical
        iconStackView.distribution = .fill
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iconStackView)
        NSLayoutConstraint.activate([
            iconStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconStackView.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 20)
        ])
    }
    func setupFirstLineStackView() {
        firstLineStackView.axis = .horizontal
        firstLineStackView.distribution = .fill
        firstLineStackView.spacing = 0
        firstLineStackView.translatesAutoresizingMaskIntoConstraints = false
        iconStackView.addArrangedSubview(firstLineStackView)
    }
    func setupSecondLineStackView() {
        secondLineStackView.axis = .horizontal
        secondLineStackView.distribution = .fill
        secondLineStackView.translatesAutoresizingMaskIntoConstraints = false
        iconStackView.addArrangedSubview(secondLineStackView)
    }
    
}
