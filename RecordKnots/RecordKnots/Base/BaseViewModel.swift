//
//  BaseViewModel.swift
//  RecordKnots
//
//  Created by 张冬 on 2018/9/13.
//  Copyright © 2018年 张冬. All rights reserved.
//

import UIKit

/**
 *  创建系统基本控件
 */
class BaseViewModel: NSObject {
    
    /// 创建系统控件：lab(默认支持layout)
    ///
    /// - Parameters:
    ///   - title:
    ///   - font: 字体大小
    ///   - color: 字体颜色
    ///   - textAlignment: 对其方式
    /// - Returns: UIlab
    static func creatLab(title: String? , font: UIFont , color: UIColor , textAlignment: NSTextAlignment = .left) -> UILabel {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.sizeToFit()
        lab.text = title
        lab.font = font
        lab.textAlignment = textAlignment
        return lab
    }
}
