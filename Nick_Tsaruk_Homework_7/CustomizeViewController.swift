//
//  CustomizeViewController.swift
//  Nick_Tsaruk_Homework_7
//
//  Created by Tsaruk Nick on 17.06.23.
//

import UIKit

class CustomizeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        avatarView.layer.cornerRadius = 100
        avatarView.layer.borderColor = UIVariables.normalColor.cgColor
        avatarView.layer.borderWidth = UIVariables.borderWidth
        
        saveButtonOutlet.layer.cornerRadius = UIVariables.buttonCornerRadius
        saveButtonOutlet.tintColor = .white
        saveButtonOutlet.backgroundColor = UIVariables.normalColor
        saveButtonOutlet.isHidden = true
        editButtonOutlet.layer.cornerRadius = UIVariables.buttonCornerRadius
        editButtonOutlet.layer.borderColor = UIVariables.normalColor.cgColor
        editButtonOutlet.layer.borderWidth = UIVariables.borderWidth
        editButtonOutlet.tintColor = UIVariables.normalColor
        
        cancelButtonOutlet.tintColor = UIVariables.normalColor
    
    }
    

    @IBOutlet private weak var avatarView: UIView!
    @IBOutlet private weak var saveButtonOutlet: UIButton!
    @IBOutlet private weak var editButtonOutlet: UIButton!
    @IBOutlet private weak var cancelButtonOutlet: UIButton!
    
    @IBAction private func cancelButtonAction() {
        dismiss(animated: true)
    }
    
    
    @IBAction private func saveButtonAction() {
        dismiss(animated: true)
    }
    
    @IBAction private func editButtonAction() {
        let storyboard = UIStoryboard(name: "GenderStoryboard", bundle: nil)
        guard let genderVC = storyboard.instantiateViewController(withIdentifier: "GenderViewController") as? GenderViewController else { return }
        navigationController?.pushViewController(genderVC, animated: true)
    }
}
