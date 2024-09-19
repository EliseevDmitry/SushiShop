//
//  UserViewCell.swift
//  SushiShop
//
//  Created by Dmitriy Eliseev on 17.04.2024.
//

import UIKit

class UserViewCell: UITableViewCell {
    private lazy var horizontalStack: UIStackView = {
        let elementUI = UIStackView()
        elementUI.axis = .horizontal
        elementUI.distribution = .fill
        elementUI.alignment = .center
        elementUI.spacing = 5
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var verticalStack: UIStackView = {
        let elementUI = UIStackView()
        elementUI.axis = .vertical
        elementUI.distribution = .fill
        elementUI.alignment = .leading
        elementUI.spacing = 5
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    
    private lazy var nameLabel: UILabel = {
        let elementUI = UILabel()
        elementUI.font = UIFont.systemFont(ofSize: 20)
        elementUI.textAlignment = .left
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var phoneLabel: UILabel = {
        let elementUI = UILabel()
        elementUI.font = UIFont.systemFont(ofSize: 15)
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var mailLabel: UILabel = {
        let elementUI = UILabel()
        elementUI.font = UIFont.systemFont(ofSize: 15)
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var rightGoIcon: UIImageView = {
        let elementUI = UIImageView()
        elementUI.tintColor = .gray
        elementUI.contentMode = .scaleAspectFit
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(verticalStack)
        horizontalStack.addArrangedSubview(rightGoIcon)
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(phoneLabel)
        verticalStack.addArrangedSubview(mailLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraint()
    }
    
    func setupConstraint(){
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: self.topAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            horizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            rightGoIcon.widthAnchor.constraint(equalTo: rightGoIcon.heightAnchor),
            rightGoIcon.widthAnchor.constraint(equalToConstant: 18),
        ])
    }
    
    func setDataInCell(data: User){
        nameLabel.text = data.name
        phoneLabel.text = String(data.phoneNumber)
        mailLabel.text = data.email
        rightGoIcon.image = UIImage(systemName: data.imageRight)
    }
}
