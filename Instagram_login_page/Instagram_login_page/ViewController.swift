//
//  ViewController.swift
//  Instagram_login_page
//
//  Created by Tatyana Korotkova on 28.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let borderColor: UIColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
    let blueColor: UIColor = UIColor(red: 0/255, green: 148/255, blue: 246/255, alpha: 1)
    let lightBlueColor: UIColor = UIColor(red: 127/255, green: 202/255, blue: 251/255, alpha: 1)
    let backgroundColor: UIColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
    let textColor: UIColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1)
    let radiusOfCorner: CGFloat = 8
    let trailingConstraint: CGFloat = -20
    let leadingConstraint: CGFloat = 20
    let topAndBottomConstaint: CGFloat = 16
    let standardHeight: CGFloat = 44
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancel"), for: .normal)
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var emptyView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "instagram")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var emptyViewTwo: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        setupTextField(textField: textField, placeholder: "Телефон, имя пользователя или эл. адрес")
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        setupTextField(textField: textField, placeholder: "Пароль")
        textField.isSecureTextEntry = true
        
        let image = UIImage(named: "visibility")
        textField.rightView = UIView(frame: CGRect(x: 10, y: 0, width: 40, height: 40))
        textField.rightViewMode = .always
        let rightImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        rightImageView.image = image
        textField.rightView?.addSubview(rightImageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.visibilityButtonPressed))
        rightImageView.addGestureRecognizer(tap)
        rightImageView.isUserInteractionEnabled = true
        return textField
    }()
    
    lazy var forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(blueColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(forgetPasswordButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = lightBlueColor
        button.layer.cornerRadius = radiusOfCorner
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = " или "
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = borderColor
        label.textAlignment = .center
        return label
    }()
    
    lazy var inlineLabel: InlineTextView = {
        let label = InlineTextView()
        return label
    }()
    
    lazy var enterWithFacebookButton: ButtonWithIconView = {
        let view = ButtonWithIconView()
        let action = UITapGestureRecognizer(target: self, action: #selector(ViewController.enterWithFacebookButtonPressed))
        view.addGestureRecognizer(action)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var horizontalLine: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var noAccountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = borderColor
        label.text = "У вас нет аккаунта?"
        label.textAlignment = .center
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрируйтесь .", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(blueColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setupViews()
    }
    
    
    private func setupViews(){
        [cancelButton, emptyView, iconImageView, emptyViewTwo, loginTextField, passwordTextField, forgetPasswordButton, enterButton, inlineLabel, enterWithFacebookButton, horizontalLine, noAccountLabel, registerButton].forEach{
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topAndBottomConstaint).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        emptyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        setupViewLeftRight(subview: emptyView)
        emptyView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        iconImageView.topAnchor.constraint(equalTo: emptyView.bottomAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        emptyViewTwo.topAnchor.constraint(equalTo: iconImageView.bottomAnchor).isActive = true
        setupViewLeftRight(subview: emptyViewTwo)
        emptyViewTwo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        
        loginTextField.topAnchor.constraint(equalTo: emptyViewTwo.bottomAnchor).isActive = true
        setupViewHeightLeftRight(subview: loginTextField)
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10).isActive = true
        setupViewHeightLeftRight(subview: passwordTextField)
        
        forgetPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12).isActive = true
        forgetPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstraint).isActive = true
        
        enterButton.topAnchor.constraint(equalTo: forgetPasswordButton.bottomAnchor, constant: 12).isActive = true
        setupViewHeightLeftRight(subview: enterButton)
        
        inlineLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor).isActive = true
        setupViewHeightLeftRight(subview: inlineLabel)
        inlineLabel.setParameters(title: "или")
        
        enterWithFacebookButton.topAnchor.constraint(equalTo: inlineLabel.bottomAnchor).isActive = true
        setupViewHeightLeftRight(subview: enterWithFacebookButton)
        enterWithFacebookButton.setParameters(imageName: "facebook", title: "Войти через Facebook")
        
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        horizontalLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        horizontalLine.topAnchor.constraint(equalTo: view.bottomAnchor,constant: -50).isActive = true
        setupViewLeftRight(subview: horizontalLine)
        horizontalLine.backgroundColor = borderColor
        
        noAccountLabel.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 16).isActive = true
        noAccountLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        registerButton.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 10).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: view.centerXAnchor,constant: 5).isActive = true
        
    }
    
    //MARK: -setup functions-
    
    private func setupTextField(textField: UITextField, placeholder: String){
        textField.placeholder = placeholder
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = borderColor.cgColor
        textField.layer.cornerRadius = radiusOfCorner
        textField.backgroundColor = backgroundColor
        textField.textColor = textColor
    }
    
    private func setupViewHeightLeftRight(subview: UIView){
        subview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstraint).isActive = true
        subview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstraint).isActive = true
        subview.heightAnchor.constraint(equalToConstant: standardHeight).isActive = true
    }
    
    private func setupViewLeftRight(subview: UIView){
        subview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstraint).isActive = true
        subview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstraint).isActive = true
    }
    
    
    //MARK: -actions-
    
    @objc func enterButtonPressed(){
        print(#function)
        checkPassword(passwordString: passwordTextField.text!,loginString: loginTextField.text!)
    }
    
    @objc func cancelButtonPressed(){
        print(#function)
    }
    
    @objc func forgetPasswordButtonPressed(){
        print(#function)
    }
    
    @objc func visibilityButtonPressed(){
        print(#function)
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @objc func enterWithFacebookButtonPressed(){
        print(#function)
        
    }
    
    @objc func registerButtonPressed(){
        print(#function)
    }
    
    private func checkPassword(passwordString: String, loginString: String){
        let password = passwordString
        let login = loginString
        var message: String = "OK"
        var title: String = "Registration"
        
        if(login.count == 0){
            message = "Login is empty"
            let alert = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if(password.count == 0){
            title = "Password"
            message = "Password is empty"
        }
        else if(password.count < 8){
            title = "Password"
            message = "Password is short"
        }
        else if(!(password.first!.isUppercase)){
            title = "Password"
            message = "Password should start with upper case"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    

}

