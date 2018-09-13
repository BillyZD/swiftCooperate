//
//  BaseViewController.swift
//  RecordKnots
//
//  Created by 张冬 on 2018/9/10.
//  Copyright © 2018年 张冬. All rights reserved.
//

import UIKit
/**
 *  app基类视图控制器
 */
class BaseViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 设置导航栏标题
    func setNavTitle(title: String) {
        self.navigationItem.titleView = BaseViewModel.creatLab(title: title, font: UIFont.systemFont(ofSize: 18, weight: .medium), color: UIColor.hex("666666"))
    }
}











