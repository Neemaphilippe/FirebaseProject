//
//  LoginViewController.swift
//  FirebaseTakeTwo
//
//  Created by Pursuit on 11/26/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Pursuitstgram"
        label.font = UIFont(name: "Times New Roman", size: 60)
        label.textColor = UIColor(red: 255/255, green: 86/255, blue: 0/255, alpha: 1.0)
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pursuitlogo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Email"
        textField.font = UIFont(name: "Times New Roman", size: 14)
        textField.backgroundColor = .white
        textField.borderStyle = .bezel
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.font = UIFont(name: "Times New Roman", size: 14)
        textField.backgroundColor = .white
        textField.borderStyle = .bezel
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Times New Roman", size: 16)
        button.backgroundColor = UIColor(red: 255/255, green: 67/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Dont have an account?",
                                                        attributes: [
                                                            NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 14)!,
                                                            NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up",
                                                  attributes: [NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 14)!,
                                                               NSAttributedString.Key.foregroundColor:  UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2540600896, green: 0.2573271394, blue: 0.9170498252, alpha: 1)
        addViews()
        setupSubViews()
    }
    
    //MARK: OBJ-C
    
    @objc func validateFields() {
        guard emailTextField.hasText, passwordTextField.hasText else {
            loginButton.backgroundColor = UIColor(red: 255/255, green: 67/255, blue: 0/255, alpha: 0.5)
            loginButton.isEnabled = false
            return
        }
        loginButton.isEnabled = true
        loginButton.backgroundColor = UIColor(red: 255/255, green: 67/255, blue: 0/255, alpha: 1)
    }
    
    @objc func showSignUp() {
        let signupVC = SignUpViewController()
        signupVC.modalPresentationStyle = .formSheet
        present(signupVC, animated: true, completion: nil)
    }
    
    @objc func handleLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            showAlert(with: "Error", and: "Please fill out all fields.")
            return
        }
        
        guard email.isValidEmail else {
            showAlert(with: "Error", and: "Please enter a valid email")
            return
        }
        
        guard password.isValidPassword else {
            showAlert(with: "Error", and: "Please enter a valid password. Passwords must have at least 8 characters.")
            return
        }
        
        FirebaseAuthService.manager.loginUser(email: email.lowercased(), password: password) { (result) in
            self.handleLoginResponse(with: result)
        }
    }
    
    //MARK: PRIVATE FUNCTIONS
    
    private func addViews(){
        view.addSubview(logoLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(logoImage)
    }
    
    private func showAlert(with title: String, and message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    private func handleLoginResponse(with result: Result<(), Error>) {
        switch result {
        case .failure(let error):
            showAlert(with: "Error", and: "Could not log in. Error: \(error)")
        case .success:
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
                else {
                    return
            }
            
        }
    }
    
    
    private func setupSubViews() {
        setupLogoLabel()
        setupCreateAccountButton()
        setupLoginStackView()
        setupLogoPhoto()
        
    }
    
    private func setupLogoLabel() {
        
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60),
            logoLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logoLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16)])
    }
    
    private func setupLogoPhoto(){
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 15),
            logoImage.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -30),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            logoImage.heightAnchor.constraint(equalToConstant: 50),
            logoImage.widthAnchor.constraint(equalTo: emailTextField.widthAnchor)
        ])
    }
    
    private func setupLoginStackView() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField,loginButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: createAccountButton.topAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 130)])
    }
    
    private func setupCreateAccountButton() {
        view.addSubview(createAccountButton)
        
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            createAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    
}
