//
//  ViewController.swift
//  SushiShop
//
//  Created by Dmitriy Eliseev on 04.04.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers(createTabsInTabBarController(), animated: false)
    createNewData()
    }

    func createTabsInTabBarController()->[UIViewController]{
        var controllers = [UIViewController]()

        
        controllers.append(
            createNav(
                with: MenuApps.ProfileController.title,
                and: MenuApps.ProfileController.image,
                viewController: ProfileController())
        )
        controllers.append(
            createNav(
                with: MenuApps.MenuController.title,
                and: MenuApps.MenuController.image,
                viewController: MenuController())
        )
        controllers.append(
            createNav(
                with: MenuApps.ShoppingCartController.title,
                and: MenuApps.ShoppingCartController.image,
                viewController: ShoppingCartController())
        )
        controllers.append(
            createNav(
                with: MenuApps.RestoransController.title,
                and: MenuApps.RestoransController.image,
                viewController: RestoransController())
        )
        return controllers
    }
    
    
    private func createNav(with title: String, and image: String, viewController: UIViewController)->UINavigationController{
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: image)
        navigationController.tabBarItem.title = title
        navigationController.viewControllers.first?.navigationItem.title = title
        return navigationController
    }
    
    private func createNewData(){
        CoreDataManager.shared.createMakizushi(title: K.AlaskaRoll.title, description: K.AlaskaRoll.description, weight: K.AlaskaRoll.weight, prise: K.AlaskaRoll.prise, image: K.AlaskaRoll.image)
        CoreDataManager.shared.createMakizushi(title: K.BonitoRoll.title, description: K.BonitoRoll.description, weight: K.BonitoRoll.weight, prise: K.BonitoRoll.prise, image: K.BonitoRoll.image)
        CoreDataManager.shared.createMakizushi(title: K.FiladelfiaRoll.title, description: K.FiladelfiaRoll.description, weight: K.FiladelfiaRoll.weight, prise: K.FiladelfiaRoll.prise, image: K.FiladelfiaRoll.image)
    }
    


}

