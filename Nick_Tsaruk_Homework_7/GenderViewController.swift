import UIKit

class GenderViewController: UIViewController {
    
    let viewTitle = UILabel()
    weak var genderDelegate: AccountDelegate?
    var config = AccountConfig(nickName: "")
    
    let maleButton = RoundedButton(title: "Male", border: true, filled: false)
    let femaleButton = RoundedButton(title: "Female", border: true, filled: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
        
        maleButton.addTarget(self, action: #selector(maleButtonAction), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(femaleButtonAction), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.backgroundColor = UIVariables.backgroundColor
        
        viewTitle.text = "Choose gender"
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(viewTitle)
        view.addSubview(maleButton)
        view.addSubview(femaleButton)
        
        NSLayoutConstraint.activate([
            viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: UIVariables.titleTopPadding),
            
            maleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            maleButton.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 25),
            
            femaleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            femaleButton.topAnchor.constraint(equalTo: maleButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func maleButtonAction() {
        let maleNicknameVC = MaleNicknameViewController()
        maleNicknameVC.maleNicknameDelegate = self
        navigationController?.pushViewController(maleNicknameVC, animated: true)
    }
    @objc private func femaleButtonAction() {
        let femaleNicknameVC = FemaleNicknameViewController()
        femaleNicknameVC.femaleNicknameDelegate = self
        navigationController?.pushViewController(femaleNicknameVC, animated: true)
    }
}

extension GenderViewController: AccountDelegate {
    func saveAccountConfig(_ config: AccountConfig) {
        genderDelegate?.saveAccountConfig(config)
    }
}
