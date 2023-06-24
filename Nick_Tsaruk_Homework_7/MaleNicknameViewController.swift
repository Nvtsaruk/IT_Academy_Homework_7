import UIKit

class MaleNicknameViewController: UIViewController {
    let viewTitle = UILabel()
    
    weak var maleNicknameDelegate: AccountDelegate?
    
    var config = AccountConfig(nickName: "")
    
    let frogButton = RoundedButton(title: "Frog", border: true, filled: false)
    let hammerButton = RoundedButton(title: "Hammer", border: true, filled: false)
    let kingButton = RoundedButton(title: "King", border: true, filled: false)
    let gunButton = RoundedButton(title: "Gun", border: true, filled: false)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
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
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        frogButton.tag = 0
        hammerButton.tag = 1
        kingButton.tag = 2
        gunButton.tag = 3
        
        viewTitle.text = "Choose nickname"
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(viewTitle)
        view.addSubview(frogButton)
        view.addSubview(hammerButton)
        view.addSubview(kingButton)
        view.addSubview(gunButton)
        
        NSLayoutConstraint.activate([
            viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: UIVariables.titleTopPadding),
            
            frogButton.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 25),
            frogButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hammerButton.topAnchor.constraint(equalTo: frogButton.bottomAnchor, constant: 20),
            hammerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            kingButton.topAnchor.constraint(equalTo: hammerButton.bottomAnchor, constant: 20),
            kingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            gunButton.topAnchor.constraint(equalTo: kingButton.bottomAnchor, constant: 20),
            gunButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func nextScreen() {
        let avatarVC = AvatarViewController()
        avatarVC.avatarDelegate = self
        navigationController?.pushViewController(avatarVC, animated: true)
    }
}

extension MaleNicknameViewController: AccountDelegate {
    func saveAccountConfig(_ config: AccountConfig) {
        maleNicknameDelegate?.saveAccountConfig(config)
    }
}
