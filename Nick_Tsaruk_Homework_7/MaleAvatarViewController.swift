//
//  MaleAvatarViewController.swift
//  Nick_Tsaruk_Homework_7
//
//  Created by Tsaruk Nick on 18.06.23.
//

import UIKit

class MaleAvatarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let maleAvatarButtons = [antButtonOutlet, personButtonOutlet, crownButtonOutlet, starButtonOutlet]
        maleAvatarButtons.forEach { button in
            guard let button = button else { return }
            button.tintColor = UIVariables.normalColor
        }
    }
    
    @IBOutlet private weak var antButtonOutlet: UIButton!
    @IBOutlet private weak var personButtonOutlet: UIButton!
    @IBOutlet private weak var crownButtonOutlet: UIButton!
    @IBOutlet private weak var starButtonOutlet: UIButton!
    
}
