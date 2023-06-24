import UIKit

class FemaleNicknameViewController: UIViewController {
    let viewTitle = UILabel()
    
    weak var femaleNicknameDelegate: AccountDelegate?
    
    var config = AccountConfig(nickName: "")
    
    let foxButton = RoundedButton(title: "Fox", border: true, filled: false)
    let mirrorButton = RoundedButton(title: "Mirror", border: true, filled: false)
    let queenButton = RoundedButton(title: "Queen", border: true, filled: false)
    let candyButton = RoundedButton(title: "Candy", border: true, filled: false)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        foxButton.addTarget(self, action: #selector(nicknameButtonAction), for: .touchUpInside)
        mirrorButton.addTarget(self, action: #selector(nicknameButtonAction), for: .touchUpInside)
        queenButton.addTarget(self, action: #selector(nicknameButtonAction), for: .touchUpInside)
        candyButton.addTarget(self, action: #selector(nicknameButtonAction), for: .touchUpInside)
        
    }
    
    @objc private func nicknameButtonAction (_ sender: UIButton) {
        switch sender.tag {
            case 0:
                config.nickName = "Fox"
                femaleNicknameDelegate?.saveAccountConfig(config)
                nextScreen()
            case 1:
                config.nickName = "Mirror"
                femaleNicknameDelegate?.saveAccountConfig(config)
                nextScreen()
            case 2:
                config.nickName = "Queen"
                femaleNicknameDelegate?.saveAccountConfig(config)
                nextScreen()
            case 3:
                config.nickName = "Candy"
                femaleNicknameDelegate?.saveAccountConfig(config)
                nextScreen()
            default:
                return
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        foxButton.tag = 0
        mirrorButton.tag = 1
        queenButton.tag = 2
        candyButton.tag = 3
        
        viewTitle.text = "Choose nickname"
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(viewTitle)
        view.addSubview(foxButton)
        view.addSubview(mirrorButton)
        view.addSubview(queenButton)
        view.addSubview(candyButton)
        
        NSLayoutConstraint.activate([
            viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: UIVariables.titleTopPadding),
            
            foxButton.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 25),
            foxButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mirrorButton.topAnchor.constraint(equalTo: foxButton.bottomAnchor, constant: 20),
            mirrorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            queenButton.topAnchor.constraint(equalTo: mirrorButton.bottomAnchor, constant: 20),
            queenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            candyButton.topAnchor.constraint(equalTo: queenButton.bottomAnchor, constant: 20),
            candyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func nextScreen() {
        let avatarVC = AvatarViewController()
        avatarVC.avatarDelegate = self
        navigationController?.pushViewController(avatarVC, animated: true)
    }
}

extension FemaleNicknameViewController: AccountDelegate {
    func saveAccountConfig(_ config: AccountConfig) {
        femaleNicknameDelegate?.saveAccountConfig(config)
    }
}
