//
//  GenderViewController.swift
//  Nick_Tsaruk_Homework_7
//
//  Created by Tsaruk Nick on 18.06.23.
//

import UIKit

class GenderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let genderButtons = [maleButtonOutlet, femaleButtonOutlet]
        genderButtons.forEach { button in
            guard let button = button else { return }
            button.layer.cornerRadius = UIVariables.buttonCornerRadius
            button.layer.borderColor = UIVariables.normalColor.cgColor
            button.layer.borderWidth = UIVariables.borderWidth
            button.tintColor = UIVariables.normalColor
        }
        
        
    }
    @IBOutlet private weak var maleButtonOutlet: UIButton!
    @IBOutlet private weak var femaleButtonOutlet: UIButton!
    
    @IBAction private func maleButtonAction() {
        let storyboard = UIStoryboard(name: "MaleNicknameStoryboard", bundle: nil)
        guard let maleVC = storyboard.instantiateViewController(withIdentifier: "MaleNicknameViewController") as? MaleNicknameViewController else { return }
        navigationController?.pushViewController(maleVC, animated: true)
    }
}
