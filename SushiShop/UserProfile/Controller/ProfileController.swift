//
//  ProfileController.swift
//  SushiShop
//
//  Created by Dmitriy Eliseev on 04.04.2024.
//

import Foundation
import UIKit
//https://apptractor.ru/info/articles/delaem-razdely-uitableview-s-vlozhennymi-tipami.html



enum Section {
    case profile(items: ProfileData)
    case settings(items: Settings)
    case info(items: Info)
    case support(items: Support)
    
    var title: String {
        switch self {
        case .profile : return "Профиль"
        case .settings : return "Настройки"
        case .info   : return "Информация"
        case .support   : return "Поддержка"
        }
    }
}


class ProfileController: UIViewController {
    
    private let profile = ProfileData(profile: (User(), Balsnce(), Promo(), Orderes()))
    private let settings = Settings(citi: "Дивногорск")
    private let info = Info()
    private let support = Support()
    private var dataSource = [Section]()
    
    
    private lazy var profileTableView: UITableView = {
        let elementUI = UITableView()
        elementUI.backgroundColor = .blue
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(profileTableView)
        profileTableView.delegate = self
        profileTableView.dataSource = self
        dataSource = createDataSource()
    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
        loadSeparator()
    }
    
    func loadSeparator(){
        profileTableView.separatorStyle = .singleLine
        profileTableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        profileTableView.separatorColor = .blue
    }
    
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}



extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .profile(items: let items) : do {
            //print(Mirror(reflecting: items).children.count)
            //return Mirror(reflecting: items).children.count
            print(Mirror(reflecting: items.profile).children.count)
            return Mirror(reflecting: items.profile).children.count
        }
        case .settings(items: let items): do {
            return items.countRow
        }
        case .info(items: let items): do {
            return items.infoArray.count
        }
        case .support(items: let items):do {
            return items.countRow
        }
        }}
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = dataSource[indexPath.section]
        switch section {
        case .profile(items: let items): do {
            switch indexPath.row {
            case 0: do {
                let cell = UserViewCell()
                cell.setDataInCell(data: items.profile.user)
                return cell
            }
            case 1:  do {
                let cell = BalanceViewCell()
                cell.setDataInCell(data: items.profile.balnce)
                return cell
            }
            case 2: do {
                let cell = PromoOrderesSupportViewCell()
                cell.setDataInCell(data: items.profile.promo)
                return cell
            }
            case 3: do {
                let cell = PromoOrderesSupportViewCell()
                cell.setDataInCell(data: items.profile.orders)
                return cell
            }
            default:
                return UITableViewCell()
            }
        }
        case .settings(items: let items):do {
            let cell = SettingsInfoViewCell()
            cell.setDataInCell(data: items)
            return cell
        }
        case .info(items: let items): do {
            let cell = SettingsInfoViewCell()
            cell.setDataInCell(data: items.infoArray[indexPath.row])
            return cell
        }
        case .support(items: let items):
            let cell = PromoOrderesSupportViewCell()
            cell.setDataInCell(data: items)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 100
        } else {
            return 40
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        dataSource[section].title
    }
    
    func createDataSource() -> [Section] {
        let profileItm = Section.profile(items: profile)
        let settingsItm = Section.settings(items: settings)
        let infoItm = Section.info(items: info)
        let supportItm = Section.support(items: support)
        return [profileItm, settingsItm, infoItm, supportItm]
        
        
    }
    
}

