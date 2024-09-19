//
//  ProfileTableModel.swift
//  SushiShop
//
//  Created by Dmitriy Eliseev on 08.04.2024.
//

import Foundation

struct ProfileTable {
    let profileData: ProfileData
    let settings: Settings
    let info: Info
    let support: Support
}

struct ProfileData{
    let profile: (user: User, balnce: Balsnce, promo: Promo, orders: Orderes)
}

struct User {
    let name: String = "Дитрий"
    let phoneNumber: Int = 9059762699
    let email: String = "dimasel@gmail.com"
    let imageRight: String = "chevron.forward"
}

struct Balsnce {
    let name: String = "Баланс"
    let count: Int = 136
    let image: String = "star.circle"
}

struct Promo {
    let name: String = "Промокоды"
    let imageLeft: String = "percent"
    let imageRight: String = "chevron.forward"
}

struct Orderes {
    let name: String = "История заказов"
    let imageLeft: String = "menucard"
    let imageRight: String = "chevron.forward"
}

struct Settings {
    let name: String = "Выбор города"
    let citi: String
    let imageRight: String = "chevron.forward"
    let countRow: Int = 1
}

struct Info {
    let infoArray:[(title: String, image: String)] = [("Восстановление истории и баллов", ""), ("О приложении","chevron.forward"), ("Другое","chevron.forward")]
}

struct Support {
    let name: String = "Сообщите об ошибке"
    let imageLeft: String = "envelope"
    let countRow: Int = 1
}



