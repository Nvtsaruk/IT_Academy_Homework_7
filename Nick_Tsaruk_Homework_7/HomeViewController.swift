
import UIKit

class HomeViewController: UIViewController {
    
    let avatarView = UIView()
    let nameLabel = UILabel()
    let avatarLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAvatarView()
        setupAvatarLabel()
        setupNameLabel()
        
        let customizeButton = createButton(title: "Customize", color: UIVariables.clearColor, titleColor: UIVariables.normalColor)
        view.addSubview(customizeButton)
        NSLayoutConstraint.activate([
            customizeButton.widthAnchor.constraint(equalToConstant: 300),
            customizeButton.heightAnchor.constraint(equalToConstant: 38),
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
    private func setupNameLabel() {
        nameLabel.text = "No Name"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 30)
        ])
    }
    func createButton(title: String, image: UIImage? = nil, color: UIColor,titleColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        button.backgroundColor = color
        button.setTitleColor(titleColor, for: .normal)
        button.layer.borderColor = UIVariables.normalColor.cgColor
        button.layer.borderWidth = UIVariables.borderWidth
        button.layer.cornerRadius = UIVariables.buttonCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        guard let image else { return button }
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.white
        return button
    }
    
    @objc func customizeButtonAction(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "CustomizeStoryboard", bundle: nil)
//        guard let customizeVC = storyboard.instantiateViewController(withIdentifier: "CustomizeViewController") as? CustomizeViewController else { return }
//        let navController = UINavigationController(rootViewController: customizeVC) // Creating a navigation controller with customizeVC at the root of the navigation stack.
//        self.present(navController, animated:true, completion: nil)
        let navVC = UINavigationController(rootViewController: CustomizeViewController())
//            navVC.modalPresentationStyle = .fullScreen
//            self.present(navVC, animated: true, completion: nil)
        present(navVC, animated: true)
    }
}

