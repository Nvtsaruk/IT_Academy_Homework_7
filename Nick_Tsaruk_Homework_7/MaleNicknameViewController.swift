//
//  MailNicknameViewController.swift
//  Nick_Tsaruk_Homework_7
//
//  Created by Tsaruk Nick on 18.06.23.
//

import UIKit

class MaleNicknameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let maleNickNameButtons = [frogButtonOutlet, hammerButtonOutlet, kingButtonOutlet, gunButtonOutlet]
        maleNickNameButtons.forEach { button in
            guard let button = button else { return }
            button.layer.cornerRadius = UIVariables.buttonCornerRadius
            button.layer.borderColor = UIVariables.normalColor.cgColor
            button.layer.borderWidth = UIVariables.borderWidth
            button.tintColor = UIVariables.normalColor
        }
        
    }
    @IBOutlet weak var frogButtonOutlet: UIButton!
    @IBOutlet weak var hammerButtonOutlet: UIButton!
    @IBOutlet weak var kingButtonOutlet: UIButton!
    @IBOutlet weak var gunButtonOutlet: UIButton!
    
    @IBAction private func nicknameButtonAction (_ sender: UIButton) {
        switch sender.tag {
            case 0:
                nextScreen()
            case 1:
                nextScreen()
            case 2:
                nextScreen()
            case 3:
                nextScreen()
            default:
                return
        }
    }
    private func nextScreen() {
        let storyboard = UIStoryboard(name: "MaleAvatarStoryboard", bundle: nil)
        guard let maleAvatarVC = storyboard.instantiateViewController(withIdentifier: "MaleAvatarViewController") as? MaleAvatarViewController else { return }
        navigationController?.pushViewController(maleAvatarVC, animated: true)
    }

}
