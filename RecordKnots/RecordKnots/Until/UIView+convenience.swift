//
//  UIView+convenience.swift
//  RecordKnots
//
//  Created by 张冬 on 2018/9/13.
//  Copyright © 2018年 张冬. All rights reserved.
//

import UIKit
/**
 *  扩展UIView的方法
 */
extension UIView {
    
    /// 切UIView的圆角
    ///
    /// - Parameters:
    ///   - conrners: 需要切割的位置
    ///   - radius: 切割的半径
    func cornerForView(conrners: UIRectCorner , radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: conrners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    
    /// 获取试图的指定类型的父试图
    ///
    /// - Parameter of: 试图类型
    /// - Returns: 父试图
    func getSupview<T: UIView>(of: T.Type) -> T? {
        for v in sequence(first: self.superview, next: {$0?.superview}) {
            if let sup = v as? T {
                return sup
            }
        }
        return nil
    }
    
}
