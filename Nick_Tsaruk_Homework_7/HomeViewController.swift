//
//  ViewController.swift
//  Nick_Tsaruk_Homework_7
//
//  Created by Tsaruk Nick on 17.06.23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarView.layer.cornerRadius = 100
        avatarView.layer.borderColor = UIVariables.normalColor.cgColor
        avatarView.layer.borderWidth = UIVariables.borderWidth
        
        customizeButtonOutlet.layer.cornerRadius = UIVariables.buttonCornerRadius
        customizeButtonOutlet.layer.borderColor = UIVariables.normalColor.cgColor
        customizeButtonOutlet.layer.borderWidth = UIVariables.borderWidth
        customizeButtonOutlet.tintColor = UIVariables.normalColor
    }

    @IBOutlet private weak var avatarView: UIView!
    @IBOutlet private weak var noAvatarLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var customizeButtonOutlet: UIButton!
    
    @IBAction func customizeButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CustomizeStoryboard", bundle: nil)
        guard let customizeVC = storyboard.instantiateViewController(withIdentifier: "CustomizeViewController") as? CustomizeViewController else { return }
        present(customizeVC, animated: true)
    }
}

