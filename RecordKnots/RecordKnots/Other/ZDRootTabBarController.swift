//
//  ZDRootTabBarController.swift
//  RecordKnots
//
//  Created by 张冬 on 2018/9/10.
//  Copyright © 2018年 张冬. All rights reserved.
//

import Foundation
import UIKit

/**
 *  app跟控制器
 */
class ZDRootTabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.configItem()
    }
    
    /// 布局item
    private func configItem() {
        let itemArr = AppTabbarItemEnum.getAllItem()
        guard itemArr.count >= 3 else {
            return
        }
        let home = HomeMainViewController()
        self.updateItem(controller: home, type: itemArr[0])
        let nav1 = BaseNavControllerViewController(rootViewController: home)
        nav1.delegate = self
        
        let detal = DetailMainViewController()
        self.updateItem(controller: detal, type: itemArr[1])
        let nav2 = BaseNavControllerViewController(rootViewController: detal)
        nav2.delegate = self
        
        let center = MyCenterMainViewController()
        self.updateItem(controller: center, type: itemArr[2])
        let nav3 = BaseNavControllerViewController(rootViewController: center)
        nav3.delegate = self
        
        self.viewControllers = [nav1 , nav2 , nav3]
    }
    /// 设置item属性
    private func updateItem(controller: UIViewController , type: AppTabbarItemEnum) {
        controller.tabBarItem.title = type.rawValue
        controller.tabBarItem.image = type.normalImage
        controller.tabBarItem.selectedImage = type.selectImage
    }

}

// MARK: - 实现导航控制器代理
extension ZDRootTabBarController: UINavigationControllerDelegate {
    /// 隐藏所有导航栏
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        navigationController.setNavigationBarHidden(true, animated: animated)
    }
    
}






