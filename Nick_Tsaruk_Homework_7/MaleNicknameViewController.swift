//
//  MailNicknameViewController.swift
//  Nick_Tsaruk_Homework_7
//
//  Created by Tsaruk Nick on 18.06.23.
//

import UIKit

class MaleNicknameViewController: UIViewController {
    let viewTitle = UILabel()
    
    weak var maleNicknameDelegate: AccountDelegate?
    var config = AccountConfig(nickName: "No Name")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViewTitle()
        
        let frogButton = RoundedButton(title: "Frog", border: true, filled: false)
        frogButton.tag = 0
        let hammerButton = RoundedButton(title: "Hammer", border: true, filled: false)
        hammerButton.tag = 1
        let kingButton = RoundedButton(title: "King", border: true, filled: false)
        kingButton.tag = 2
        let gunButton = RoundedButton(title: "Gun", border: true, filled: false)
        gunButton.tag = 3
        
        view.addSubview(frogButton)
        view.addSubview(hammerButton)
        view.addSubview(kingButton)
        view.addSubview(gunButton)
        
        NSLayoutConstraint.activate([
            frogButton.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 25),
            frogButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hammerButton.topAnchor.constraint(equalTo: frogButton.bottomAnchor, constant: 20),
            hammerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            kingButton.topAnchor.constraint(equalTo: hammerButton.bottomAnchor, constant: 20),
            kingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gunButton.topAnchor.constraint(equalTo: kingButton.bottomAnchor, constant: 20),
            gunButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        frogButton.addTarget(self, action: #selector(nicknameButtonAction), for: .touchUpInside)
        hammerButton.addTarget(self, action: #selector(nicknameButtonAction), for: .touchUpInside)
        kingButton.addTarget(self, action: #selector(nicknameButtonAction), for: .touchUpInside)
        gunButton.addTarget(self, action: #selector(nicknameButtonAction), for: .touchUpInside)
        
    }
    
    @objc private func nicknameButtonAction (_ sender: UIButton) {
        switch sender.tag {
            case 0:
                config.nickName = "Frog"
                maleNicknameDelegate?.saveAccountConfig(config)
                nextScreen()
            case 1:
                config.nickName = "Hammer"
                maleNicknameDelegate?.saveAccountConfig(config)
                nextScreen()
            case 2:
                config.nickName = "King"
                maleNicknameDelegate?.saveAccountConfig(config)
                nextScreen()
            case 3:
                config.nickName = "Gun"
                maleNicknameDelegate?.saveAccountConfig(config)
                nextScreen()
            default:
                return
        }
    }
    
    private func setupViewTitle() {
        viewTitle.text = "Choose nickname"
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewTitle)
        NSLayoutConstraint.activate([
            viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: UIVariables.titleTopPadding)
        ])
    }
    private func nextScreen() {
        let maleAvatarVC = MaleAvatarViewController()
        maleAvatarVC.maleAvatarDelegate = self
        navigationController?.pushViewController(maleAvatarVC, animated: true)
    }
}

extension MaleNicknameViewController: AccountDelegate {
    func saveAccountConfig(_ config: AccountConfig) {
        maleNicknameDelegate?.saveAccountConfig(config)
    }
}
