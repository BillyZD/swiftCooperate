//
//  HomeIncidentStruct.swift
//  RecordKnots
//
//  Created by 张冬 on 2018/9/13.
//  Copyright © 2018年 张冬. All rights reserved.
//

import Foundation
/**
 * 首页事件的结构体
 */
struct HomeIncidentStruct: incidentBaseProtocol {
    var idIncident: String
    
    var titleIncident: String
    
    var timeIncident: String
    
    var describeIncident: String
    
    var imageUrl: String?
    
}
