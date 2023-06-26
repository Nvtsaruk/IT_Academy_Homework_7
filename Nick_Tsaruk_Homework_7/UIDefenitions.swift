import UIKit

enum UIVariables {
    static let lightGray = UIColor.systemGray6
    static let gray = UIColor.systemGray4
    static let clearColor = UIColor.clear
    static let normalColor = UIColor.systemPurple
    static let borderWidth:CGFloat = 1
    static let buttonCornerRadius:CGFloat = 10
    static let titleTopPadding:CGFloat = 70
    static let backgroundColor = UIColor.systemBackground
}

let largeConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .semibold, scale: .large)

enum Logos {
        static let ant = UIImage(systemName: "ant", withConfiguration: largeConfig)
        static let person = UIImage(systemName: "person", withConfiguration: largeConfig)
        static let crown = UIImage(systemName: "crown", withConfiguration: largeConfig)
        static let star = UIImage(systemName: "star", withConfiguration: largeConfig)
}

class RoundedButton: UIButton {
    convenience init(title: String, image: UIImage? = nil , border: Bool, filled: Bool) {
        self.init()
        setTitle(title, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        if image != nil {
            self.widthAnchor.constraint(equalToConstant: 200).isActive = true
            self.heightAnchor.constraint(equalToConstant: 200).isActive = true
            self.setImage(image, for: .normal)
        } else {
            self.widthAnchor.constraint(equalToConstant: 300).isActive = true
            self.heightAnchor.constraint(equalToConstant: 38).isActive = true
        }
        self.layer.cornerRadius = UIVariables.buttonCornerRadius
        if filled {
            backgroundColor = UIVariables.normalColor
            setTitleColor(.white, for: .normal)
        } else {
            setTitleColor(UIVariables.normalColor, for: .normal)
            self.tintColor = UIVariables.normalColor
        }
        if border {
            self.layer.borderColor = UIVariables.normalColor.cgColor
            self.layer.borderWidth = UIVariables.borderWidth
        }
    }
}

