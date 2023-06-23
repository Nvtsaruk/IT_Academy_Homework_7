//
//  GenderViewController.swift
//  Nick_Tsaruk_Homework_7
//
//  Created by Tsaruk Nick on 18.06.23.
//

import UIKit

class GenderViewController: UIViewController {
    
    let viewTitle = UILabel()
    var genderDelegate: AccountDelegate?
    var config = AccountConfig(nickName: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViewTitle()
        
        let maleButton = RoundedButton(title: "Male", border: true, filled: false)
        let femaleButton = RoundedButton(title: "Female", border: true, filled: false)
        view.addSubview(maleButton)
        view.addSubview(femaleButton)
        
        NSLayoutConstraint.activate([
            maleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            maleButton.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 25),
            femaleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            femaleButton.topAnchor.constraint(equalTo: maleButton.bottomAnchor, constant: 20)
        ])
        maleButton.addTarget(self, action: #selector(maleButtonAction), for: .touchUpInside)
        
        
    }
    
    
    private func setupViewTitle() {
        viewTitle.text = "Choose gender"
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewTitle)
        NSLayoutConstraint.activate([
            viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: UIVariables.titleTopPadding)
        ])
    }
    
    @objc private func maleButtonAction() {
        let maleNicknameVC = MaleNicknameViewController()
        maleNicknameVC.maleNicknameDelegate = self
        navigationController?.pushViewController(maleNicknameVC, animated: true)
        
    }
}

extension GenderViewController: AccountDelegate {
    func saveAccountConfig(_ config: AccountConfig) {
        genderDelegate?.saveAccountConfig(config)
    }
}
