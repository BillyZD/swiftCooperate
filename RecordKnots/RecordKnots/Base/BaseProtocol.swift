//
//  BaseProtocol.swift
//  RecordKnots
//
//  Created by 张冬 on 2018/9/13.
//  Copyright © 2018年 张冬. All rights reserved.
//

import Foundation

/// 定义事件的基本协议
protocol incidentBaseProtocol {
    
    /// 事件ID标示
    var idIncident: String {set get}
    
    /// 事件标题
    var titleIncident: String {set get}
    
    /// 事件的事件
    var timeIncident: String {set get}
    
    /// 简介
    var describeIncident: String {set get}
    
    /// 图片
    var imageUrl: String? {set get}
}
