//
//  DefineAppTabbar.swift
//  RecordKnots
//
//  Created by 张冬 on 2018/9/10.
//  Copyright © 2018年 张冬. All rights reserved.
//

import UIKit


/// 跟试图tabbar配置
///
/// - homeItem: 首页
/// - detailItem: 详情
/// - myCenterItem: 个人中心
enum AppTabbarItemEnum: String {
    case homeItem = "首页"
    case detailItem = "详情"
    case myCenterItem = "我的"
    
    /// 正常颜色
    var normalColor: UIColor {
        return UIColor.hex("#666666")
    }
    
    /// 高亮颜色
    var selectColor: UIColor {
        return UIColor.hex("$2196F3")
    }
    
    /// 正常的图标
    var normalImage: UIImage? {
        switch self {
        case .homeItem:
            return UIImage(named: "tabbarNormalHome")
        case .detailItem:
            return UIImage(named: "tabbaeNormalDetail")
        case .myCenterItem:
            return UIImage(named: "tabbarNormaUser")
        }
    }
    /// 高亮的颜色
    var selectImage: UIImage? {
        switch self {
        case .homeItem:
            return UIImage(named: "tabbarSelectHome")
        case .detailItem:
            return UIImage(named: "tabbarSelectDetail")
        case .myCenterItem:
            return UIImage(named: "tabbarSelectUser")
        }
    }
 
    /// 获取所有item
    static func getAllItem() -> [AppTabbarItemEnum] {
        return [.homeItem , .detailItem , .myCenterItem]
    }
    
    
}







