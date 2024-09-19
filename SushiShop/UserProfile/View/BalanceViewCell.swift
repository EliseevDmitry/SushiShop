//
//  BalanceViewCell.swift
//  SushiShop
//
//  Created by Dmitriy Eliseev on 17.04.2024.
//

import UIKit

class BalanceViewCell: UITableViewCell {
    
    private lazy var horizontalStack: UIStackView = {
        let elementUI = UIStackView()
        elementUI.axis = .horizontal
        elementUI.distribution = .fill
        elementUI.alignment = .center
        elementUI.spacing = 5
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var imageIcon: UIImageView = {
        let elementUI = UIImageView()
        elementUI.tintColor = .red
        elementUI.contentMode = .scaleAspectFit
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var captionLabel: UILabel = {
        let elementUI = UILabel()
        elementUI.font = UIFont.systemFont(ofSize: 15)
        elementUI.textAlignment = .left
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var balanceLabel: UILabel = {
        let elementUI = UILabel()
        elementUI.font = UIFont.systemFont(ofSize: 15)
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(imageIcon)
        horizontalStack.addArrangedSubview(captionLabel)
        horizontalStack.addArrangedSubview(balanceLabel)
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
            imageIcon.widthAnchor.constraint(equalTo: imageIcon.heightAnchor),
            imageIcon.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func setDataInCell(data: Balsnce){
        imageIcon.image = UIImage(systemName: data.image)
        captionLabel.text = data.name
        balanceLabel.text = String(data.count)
    }
    
    func updateBalance(balance: Int){
        balanceLabel.text = String(balance)
    }
}
