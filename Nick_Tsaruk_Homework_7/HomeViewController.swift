
import UIKit

class HomeViewController: UIViewController {
    
    let avatarView = UIView()
    let avatarLabel = UILabel()
    let avatarImg = UIImageView()
    let nameLabel = UILabel()
    
    
    var config = AccountConfig(nickName: "No Name")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAvatarView()
        setupAvatarLabel()
        setupNameLabel()
        setupAvatarImg()
        
        let customizeButton = RoundedButton(title: "Customize", border: true, filled: false)
        view.addSubview(customizeButton)
        NSLayoutConstraint.activate([
                    customizeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    customizeButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30)
                ])
        customizeButton.addTarget(self, action: #selector(customizeButtonAction), for: .touchUpInside)
        
    }
    private func setupAvatarView() {
        avatarView.backgroundColor = UIVariables.lightGray
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.layer.cornerRadius = 125
        avatarView.layer.borderColor = UIVariables.normalColor.cgColor
        avatarView.layer.borderWidth = UIVariables.borderWidth
        view.addSubview(avatarView)
        NSLayoutConstraint.activate([
            avatarView.widthAnchor.constraint(equalToConstant: 250),
            avatarView.heightAnchor.constraint(equalToConstant: 250),
            avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
    }
    private func setupAvatarLabel() {
        avatarLabel.text = "No Avatar"
        avatarLabel.textColor = UIVariables.gray
        avatarLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarView.addSubview(avatarLabel)
        NSLayoutConstraint.activate([
            avatarLabel.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            avatarLabel.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor)
        ])
    }
    private func setupAvatarImg() {
        avatarImg.image = config.avatarImg
        avatarImg.tintColor = UIVariables.normalColor
        avatarView.addSubview(avatarImg)
        avatarImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImg.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            avatarImg.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor)
        ])
    }
    private func setupNameLabel() {
        nameLabel.text = config.nickName
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 30)
        ])
    }
    
    @objc func customizeButtonAction(_ sender: UIButton) {
        let customizeVC = CustomizeViewController()
        let navController = UINavigationController(rootViewController: customizeVC) // Creating a navigation controller with customizeVC at the root of the navigation stack.
        config.nickName = nameLabel.text ?? "No Name"
        config.avatarImg = avatarImg.image
        customizeVC.customizeDelegate = self
        self.present(navController, animated:true, completion: nil)
    }
}

extension HomeViewController: AccountDelegate {
    func saveAccountConfig(_ config: AccountConfig) {
        nameLabel.text = config.nickName
        guard let img = config.avatarImg else { return }
        avatarLabel.isHidden = true
        avatarImg.image = img
    }
    
    
}

