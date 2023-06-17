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
        avatarView.layer.borderColor = UIColor.systemPurple.cgColor
        avatarView.layer.borderWidth = 3
        
        customizeButtonOutlet.layer.cornerRadius = 5
        customizeButtonOutlet.layer.borderColor = UIColor.systemPurple.cgColor
        customizeButtonOutlet.layer.borderWidth = 1
    }

    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var noAvatarLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var customizeButtonOutlet: UIButton!
    
}

