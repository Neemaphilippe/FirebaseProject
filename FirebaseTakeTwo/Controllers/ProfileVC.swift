//
//  ProfileVC.swift
//  FirebaseTakeTwo
//
//  Created by Pursuit on 11/30/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
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
    
    lazy var profileImageButton: UIButton = {
        let button = UIButton()
        button.setImage(.remove, for: .normal)
        return button
    }()
    
    lazy var displayNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Times New Roman", size: 30)
        label.textColor = .darkGray
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
        
    }()
    
    lazy var editButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setImage(.remove, for: .normal)
//        button.addTarget(self, action: #selector(editButtonPressed), for: .touchDown)
        
        return button
    }()
    
    
    //MARK: PRIVATE FUNCTIONS
    
    private func addViews(){
        view.addSubview(profileLabel)
        view.addSubview(profileImage)
        view.addSubview(profileImageButton)
    }
    
    private func constrainPL(){
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16)])
    }
    
    private func constrainPI(){
        
    }
    
    private func constrainProfileButton(){
        
    }
    
    
    private func setUpConstraints(){
        constrainPL()
        constrainPI()
        constrainProfileButton()
        constrainEditButton()
        
    }
    
    private func constrainEditButton(){
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.heightAnchor.constraint(equalToConstant: 10),
            editButton.widthAnchor.constraint(equalToConstant: 25),
            editButton.bottomAnchor.constraint(equalTo: displayNameLabel.bottomAnchor),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func buttonElement(){
        editButton.setTitleColor(<#T##color: UIColor?##UIColor?#>, for: <#T##UIControl.State#>)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setUpConstraints()

     
    }
    



}
