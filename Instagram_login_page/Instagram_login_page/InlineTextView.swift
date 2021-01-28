//
//  InlineTextView.swift
//  Instagram_login_page
//
//  Created by Tatyana Korotkova on 28.01.2021.
//

import UIKit

class InlineTextView: UIView {
    
    var borderColor: UIColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
    
    lazy var horizontalLine: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = borderColor
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setParameters(title: String){
            self.textLabel.text = title
    }
    
    private func setupViews(){
        [horizontalLine, textLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        horizontalLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        horizontalLine.backgroundColor = borderColor
        horizontalLine.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        horizontalLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        horizontalLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        textLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
}
