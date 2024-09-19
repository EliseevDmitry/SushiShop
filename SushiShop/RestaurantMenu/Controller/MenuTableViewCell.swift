//
//  MenuTableViewCell.swift
//  SushiShop
//
//  Created by Dmitriy Eliseev on 04.04.2024.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    static let identifier = "MenuTableViewCell"
    
    private lazy var verticalStack: UIStackView = {
        let elementUI = UIStackView()
        elementUI.axis = .vertical
        elementUI.spacing = 3
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var titleLabel: UILabel = {
        let elementUI = UILabel()
        elementUI.text = "Капамаки"
        elementUI.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 19)
        elementUI.textColor = .white
        elementUI.textAlignment = .left
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var descriptionLabel: UILabel = {
        let elementUI = UILabel()
        elementUI.text = "Рис, авакадо, соус темпура, нори, Рис, авакадо, соус темпура, нори"
        elementUI.font = UIFont(name: "TimesNewRomanPSMT", size: 17)
        elementUI.textColor = .gray
        elementUI.numberOfLines = 0
        elementUI.textAlignment = .left
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var fotoImage: UIImageView = {
        let elementUI = UIImageView()
        let image = UIImage(named: "alaska")
        elementUI.image = image
        elementUI.clipsToBounds = true
        elementUI.contentMode = .scaleToFill
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var horizontalStack: UIStackView = {
        let elementUI = UIStackView()
        elementUI.axis = .horizontal
        elementUI.distribution = .equalSpacing
        elementUI.spacing = 5
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var weightLabel: UILabel = {
        let elementUI = UILabel()
        elementUI.text = "340 г"
        elementUI.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 15)
        elementUI.textColor = .white
        elementUI.textAlignment = .left
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    private lazy var priseButton: UIButton = {
        var container = AttributeContainer()
        container.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 18)
        var configuration = UIButton.Configuration.gray() // 1
        configuration.cornerStyle = .capsule // 2
        configuration.baseForegroundColor = UIColor.white
        configuration.baseBackgroundColor = .red
        configuration.buttonSize = .medium
        configuration.attributedTitle = AttributedString("550 \u{20BD}", attributes: container)//create unicode simbol50
        let elementUI = UIButton(configuration: configuration, primaryAction: nil)
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(descriptionLabel)
        verticalStack.addArrangedSubview(fotoImage)
        verticalStack.addArrangedSubview(horizontalStack)
        horizontalStack.addArrangedSubview(weightLabel)
        horizontalStack.addArrangedSubview(priseButton)
        priseButton.addTarget(.none, action: #selector(addSushiInBasket), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        fotoImage.layer.cornerRadius = 5
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            titleLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            
            fotoImage.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),

            priseButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    
        //priseButton.layer.cornerRadius = priseButton.frame.height/2
        priseButton.layer.cornerRadius = priseButton.frame.height/2
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        layoutIfNeeded()
    }
    
    @objc func addSushiInBasket(){
        print(self.titleLabel.text!)
    }
    
    func setDataInCell(makizushi: MakizushiModel){
        titleLabel.text = makizushi.title
        descriptionLabel.text = makizushi.description
        weightLabel.text = String(makizushi.weight) + " г"
        priseButton.setTitle(String(makizushi.prise), for: .normal)
        if let image = makizushi.image {
            fotoImage.image = image
        }
    }
   
}
