//
//  ViewController.swift
//  Lesson-Layouts
//
//  Created by Tatyana Korotkova on 25.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancel"), for: .normal)
        //работает только при нажатий на левый нижний край креста (?)
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var emptyView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vk_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var emptyViewTwo: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email или телефон"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 8
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 8
        textField.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        textField.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1)
        textField.isSecureTextEntry = true
        
        let image = UIImage(named: "question")
        textField.rightView = UIView(frame: CGRect(x: 10, y: 0, width: 40, height: 40))
        textField.rightViewMode = .always
        let rightImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        rightImageView.image = image
        textField.rightView?.addSubview(rightImageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.questionButtonPressed))
        rightImageView.addGestureRecognizer(tap)
        rightImageView.isUserInteractionEnabled = true
        return textField
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor(red: 168/255, green: 194/255, blue: 229/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var enterWithApple: PrimaryView = {
        let view = PrimaryView()
        let action = UITapGestureRecognizer(target: self, action: #selector(ViewController.enterWithAppleButtonPressed))
        view.addGestureRecognizer(action)
        view.isUserInteractionEnabled = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews(){
        [cancelButton, emptyView, iconImageView, emptyViewTwo, loginTextField, passwordTextField, enterButton, enterWithApple].forEach{
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let trailingConstraint: CGFloat = -20
        let leadingConstraint: CGFloat = 20
        let topAndBottomConstaint: CGFloat = 16
        let standardHeight: CGFloat = 44
        
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topAndBottomConstaint).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        emptyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstraint).isActive = true
        emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstraint).isActive = true
        emptyView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        iconImageView.topAnchor.constraint(equalTo: emptyView.bottomAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        emptyViewTwo.topAnchor.constraint(equalTo: iconImageView.bottomAnchor).isActive = true
        emptyViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstraint).isActive = true
        emptyViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstraint).isActive = true
        emptyViewTwo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        loginTextField.topAnchor.constraint(equalTo: emptyViewTwo.bottomAnchor).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstraint).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstraint).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: standardHeight).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstraint).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstraint).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: standardHeight).isActive = true
        
        enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25).isActive = true
        enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstraint).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstraint).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: standardHeight).isActive = true
        
        enterWithApple.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -topAndBottomConstaint).isActive = true
        enterWithApple.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstraint).isActive = true
        enterWithApple.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstraint).isActive = true
        enterWithApple.heightAnchor.constraint(equalToConstant: standardHeight).isActive = true
        enterWithApple.setParameters(imageName: "apple_logo", title: "Войти через Apple")
    }
    
    //MARK: -actions-
    
    @objc func enterButtonPressed(){
        print(#function)
    }
    
    @objc func cancelButtonPressed(){
        print(#function)
    }
    
    @objc func questionButtonPressed(){
        print(#function)
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @objc func enterWithAppleButtonPressed(){
        print(#function)
    }


}

