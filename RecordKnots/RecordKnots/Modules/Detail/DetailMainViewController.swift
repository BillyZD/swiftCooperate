//
//  DetailMainViewController.swift
//  RecordKnots
//
//  Created by 张冬 on 2018/9/10.
//  Copyright © 2018年 张冬. All rights reserved.
//

import UIKit

/**
 *  详情的主控制器
 */
class DetailMainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "详情"
        self.view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
