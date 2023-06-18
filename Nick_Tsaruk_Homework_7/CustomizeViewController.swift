//
//  CustomizeViewController.swift
//  Nick_Tsaruk_Homework_7
//
//  Created by Tsaruk Nick on 17.06.23.
//

import UIKit

class CustomizeViewController: UIViewController {
    let avatarView = UIView()
    let avatarLabel = UILabel()
    let nameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupAvatarView()
        setupAvatarLabel()
        setupNameLabel()
        
        let saveButton = createButton(title: "Save", color: UIVariables.normalColor, titleColor: .white,border: true)
        let editButton = createButton(title: "Edit", color: UIVariables.clearColor, titleColor: UIVariables.normalColor,border: true)
        let cancelButton = createButton(title: "Cancel", color: UIVariables.clearColor, titleColor: UIVariables.normalColor, border: false)
        view.addSubview(saveButton)
        view.addSubview(editButton)
        view.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            saveButton.widthAnchor.constraint(equalToConstant: 300),
            saveButton.heightAnchor.constraint(equalToConstant: 38),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: editButton.topAnchor, constant: -5),
            editButton.widthAnchor.constraint(equalToConstant: 300),
            editButton.heightAnchor.constraint(equalToConstant: 38),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -5),
            cancelButton.widthAnchor.constraint(equalToConstant: 300),
            cancelButton.heightAnchor.constraint(equalToConstant: 38),
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
        //        saveButtonOutlet.layer.cornerRadius = UIVariables.buttonCornerRadius
        //        saveButtonOutlet.tintColor = .white
        //        saveButtonOutlet.backgroundColor = UIVariables.normalColor
        //        saveButtonOutlet.isHidden = true
        //        editButtonOutlet.layer.cornerRadius = UIVariables.buttonCornerRadius
        //        editButtonOutlet.layer.borderColor = UIVariables.normalColor.cgColor
        //        editButtonOutlet.layer.borderWidth = UIVariables.borderWidth
        //        editButtonOutlet.tintColor = UIVariables.normalColor
        //
        //        cancelButtonOutlet.tintColor = UIVariables.normalColor
        
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
            avatarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
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
    
    func createButton(title: String, image: UIImage? = nil, color: UIColor,titleColor: UIColor, border: Bool) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        button.backgroundColor = color
        button.setTitleColor(titleColor, for: .normal)
        if border {
            button.layer.borderColor = UIVariables.normalColor.cgColor
            button.layer.borderWidth = UIVariables.borderWidth
            button.layer.cornerRadius = UIVariables.buttonCornerRadius
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        guard let image else { return button }
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.white
        return button
    }
    //    @IBOutlet private weak var avatarView: UIView!
    //    @IBOutlet private weak var saveButtonOutlet: UIButton!
    //    @IBOutlet private weak var editButtonOutlet: UIButton!
    //    @IBOutlet private weak var cancelButtonOutlet: UIButton!
    
    //    @IBAction private func cancelButtonAction() {
    //        dismiss(animated: true)
    //    }
    
    
    //    @IBAction private func saveButtonAction() {
    //        dismiss(animated: true)
    //    }
    
    //    @IBAction private func editButtonAction() {
    //        let storyboard = UIStoryboard(name: "GenderStoryboard", bundle: nil)
    //        guard let genderVC = storyboard.instantiateViewController(withIdentifier: "GenderViewController") as? GenderViewController else { return }
    //        navigationController?.pushViewController(genderVC, animated: true)
    //    }
}
