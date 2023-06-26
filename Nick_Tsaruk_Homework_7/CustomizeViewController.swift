import UIKit

class CustomizeViewController: UIViewController {
    let avatarView = UIView()
    let avatarLabel = UILabel()
    let nameLabel = UILabel()
    let avatarImg = UIImageView()
    
    let saveButton = RoundedButton(title: "Save", border: false, filled: true)
    let editButton = RoundedButton(title: "Edit", border: true, filled: false)
    let cancelButton = RoundedButton(title: "Cancel", border: false, filled: false)
    
    weak var customizeDelegate: AccountDelegate?
    
    var config = AccountConfig(nickName: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tempConfig = customizeDelegate?.config else { return }
        config = tempConfig
        
        setupUI()
        
        if config.avatarImg != nil {
            avatarLabel.isHidden = true
        }
        
        saveButton.isHidden = true
        
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        
    }
    private func setupUI() {
        view.backgroundColor = UIVariables.backgroundColor
        
        avatarView.backgroundColor = UIVariables.lightGray
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.layer.cornerRadius = 125
        avatarView.layer.borderColor = UIVariables.normalColor.cgColor
        avatarView.layer.borderWidth = UIVariables.borderWidth
        avatarView.clipsToBounds = true
        
        avatarLabel.text = "No Avatar"
        avatarLabel.textColor = UIVariables.gray
        avatarLabel.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImg.image = config.avatarImg
        avatarImg.tintColor = UIVariables.normalColor
        avatarImg.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = config.nickName
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(avatarView)
        avatarView.addSubview(avatarLabel)
        avatarView.addSubview(avatarImg)
        view.addSubview(nameLabel)
        view.addSubview(saveButton)
        view.addSubview(editButton)
        view.addSubview(cancelButton)
        
        NSLayoutConstraint.activate([
            avatarView.widthAnchor.constraint(equalToConstant: 250),
            avatarView.heightAnchor.constraint(equalToConstant: 250),
            avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            avatarLabel.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            avatarLabel.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),
            
            avatarImg.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            avatarImg.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 30),
            
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: editButton.topAnchor, constant: -5),
            
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -5),
            
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
    
    @objc private func saveButtonAction() {
        guard let nickName = nameLabel.text else { return }
        config.nickName = nickName
        guard let img = avatarImg.image else { return }
        config.avatarImg = img
        customizeDelegate?.saveAccountConfig(config)
        dismiss(animated: true)
        
    }
    
    @objc private func editButtonAction() {
        let genderVC = GenderViewController()
        genderVC.genderDelegate = self
        navigationController?.pushViewController(genderVC, animated: true)
    }
    
    @objc private func cancelButtonAction() {
        dismiss(animated: true)
    }
    
}

extension CustomizeViewController: AccountDelegate {
    func saveAccountConfig(_ config: AccountConfig) {
        saveButton.isHidden = false
        nameLabel.text = config.nickName
        guard let img = config.avatarImg else { return }
        avatarLabel.isHidden = true
        avatarImg.image = img
    }
}
