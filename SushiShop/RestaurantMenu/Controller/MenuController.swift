//
//  MenuController.swift
//  SushiShop
//
//  Created by Dmitriy Eliseev on 04.04.2024.
//

import Foundation
import UIKit



class MenuController: UIViewController {
    
    private lazy var menuTable: UITableView = {
        let elementUI = UITableView()
        elementUI.translatesAutoresizingMaskIntoConstraints = false
        return elementUI
    } ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuTable.delegate = self
        self.menuTable.dataSource = self
        print(view.subviews.count)
        view.addSubview(menuTable)
        //цвет основного фона табла
        menuTable.backgroundColor = .black

    }
    
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
        loadSeparator()
    }
    
    func loadSeparator(){
        menuTable.separatorStyle = .singleLine
        menuTable.separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        menuTable.separatorColor = .white
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            menuTable.topAnchor.constraint(equalTo: self.view.topAnchor),
            menuTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            menuTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            menuTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataManager.shared.countOfMakizushi()
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//        guard let meal = person?.meals?[indexPath.row] as? Meal, let mealDate = meal.date else {
//            return cell!
//        }
//        cell!.textLabel!.text = dateFormatter.string(from: mealDate)
//        return cell!
//    }
//    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuTableViewCell()
        //цвет ячейки в зоне сепоратора
       cell.backgroundColor = .clear
        cell.setDataInCell(makizushi: CoreDataManager.shared.getMakizushi(index: indexPath.row)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    
}
