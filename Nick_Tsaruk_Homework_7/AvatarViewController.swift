import UIKit

class AvatarViewController: UIViewController {

    let viewTitle = UILabel()
    let iconStackView = UIStackView()
    let firstLineStackView = UIStackView()
    let secondLineStackView = UIStackView()
    
    weak var avatarDelegate: AccountDelegate?
    var config = AccountConfig(nickName: "")
    
    let antButton = RoundedButton(title: "",image: Logos.ant, border: false, filled: false)
    let personButton = RoundedButton(title: "",image: Logos.person, border: false, filled: false)
    let crownButton = RoundedButton(title: "",image: Logos.crown, border: false, filled: false)
    let starButton = RoundedButton(title: "",image: Logos.star, border: false, filled: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let tempConfig = avatarDelegate?.config else { return }
        config = tempConfig
        
        setupUI()
        
        antButton.addTarget(self, action: #selector(avatarButtonAction(_:)), for: .touchUpInside)
        personButton.addTarget(self, action: #selector(avatarButtonAction(_:)), for: .touchUpInside)
        crownButton.addTarget(self, action: #selector(avatarButtonAction(_:)), for: .touchUpInside)
        starButton.addTarget(self, action: #selector(avatarButtonAction(_:)), for: .touchUpInside)
    }
    
    @objc private func avatarButtonAction(_ sender: UIButton) {
        config.avatarImg = sender.currentImage
        avatarDelegate?.saveAccountConfig(config)
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = UIVariables.backgroundColor
        
        viewTitle.text = "Choose avatar"
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        
        antButton.tag = 0
        personButton.tag = 1
        crownButton.tag = 2
        starButton.tag = 3
        
        iconStackView.axis = .vertical
        iconStackView.distribution = .fill
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        
        firstLineStackView.axis = .horizontal
        firstLineStackView.distribution = .fill
        firstLineStackView.spacing = 0
        firstLineStackView.translatesAutoresizingMaskIntoConstraints = false
        
        secondLineStackView.axis = .horizontal
        secondLineStackView.distribution = .fill
        secondLineStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(viewTitle)
        view.addSubview(iconStackView)
        iconStackView.addArrangedSubview(firstLineStackView)
        iconStackView.addArrangedSubview(secondLineStackView)
        firstLineStackView.addArrangedSubview(antButton)
        firstLineStackView.addArrangedSubview(personButton)
        secondLineStackView.addArrangedSubview(crownButton)
        secondLineStackView.addArrangedSubview(starButton)
        
        NSLayoutConstraint.activate([
            viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: UIVariables.titleTopPadding),
            
            iconStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconStackView.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 20)
        ])
    }
}
