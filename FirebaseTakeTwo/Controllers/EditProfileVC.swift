//
//  EditProfileVC.swift
//  FirebaseTakeTwo
//
//  Created by Pursuit on 12/1/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {
    
    var settingFromLogin = false
    
    var image = UIImage() {
        didSet {
            self.profileImage.image = image
        }
    }
    
    var imageURL: URL? = nil
    
    //MARK: UI OBJECTS
    
    lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Profile"
        label.font = UIFont(name: "Times New Roman", size: 50)
        label.textColor = .darkGray
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        return image
        
    }()
    
    lazy var addProfileImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Image", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Times New Roman", size: 14)
        button.backgroundColor = .lightGray
        return button
    }()
    
    lazy var displayNameTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Times New Roman", size: 30)
        tf.textColor = .darkGray
        tf.backgroundColor = .clear
        tf.textAlignment = .center
        return tf
        
    }()
    
    //MARK: PRIVATE FUNCTIONS
    
    private func addViews(){
        view.addSubview(profileLabel)
        view.addSubview(profileImage)
        view.addSubview(addProfileImageButton)
    }
    
    private func constrainPL(){
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16)])
    }
    
    private func constrainPI(){
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            profileImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: self.view.bounds.width / 2),
            profileImage.widthAnchor.constraint(equalToConstant: self.view.bounds.width / 2)
        ])
        
    }
    
    private func constrainAddImageButton(){
        addProfileImageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addProfileImageButton.topAnchor.constraint(equalTo: displayNameTextField.bottomAnchor, constant: 50),
            addProfileImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addProfileImageButton.heightAnchor.constraint(equalToConstant: 50),
            addProfileImageButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 3)
        ])
        
    }
    private func constrainDisplayNameTextField() {
        displayNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            displayNameTextField.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 30),
            displayNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            displayNameTextField.heightAnchor.constraint(equalToConstant: 30),
            displayNameTextField.widthAnchor.constraint(equalToConstant: view.bounds.width / 2)
        ])
    }
    
    private func setUpConstraints(){
        constrainPL()
        constrainPI()
        constrainAddImageButton()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setUpConstraints()
    }
    
    
    
    
    
    
    
}
