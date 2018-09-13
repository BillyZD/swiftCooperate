//
//  HomeMainTableViewCell.swift
//  RecordKnots
//
//  Created by 张冬 on 2018/9/13.
//  Copyright © 2018年 张冬. All rights reserved.
//

import UIKit

/**
 *  自定义首页tableviewcell
 */
class HomeMainTableViewCell: UITableViewCell {
    /// 显示标题的lab
    private let titlelab = BaseViewModel.creatLab(title: nil, font: UIFont.systemFont(ofSize: 14, weight: .medium), color: UIColor.hex("#666666"))
    /// 显示时间的lab
    private let timeLab = BaseViewModel.creatLab(title: nil, font: UIFont.systemFont(ofSize: 14), color: UIColor.hex("666666"))
    /// 显示简介的lab
    private let describeLab = BaseViewModel.creatLab(title: nil, font: UIFont.systemFont(ofSize: 12), color: UIColor.hex("#999999"))
    /// 显示封面的image
    private lazy var mainImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.hex("F5F5F5")
        return image
    }()
    /// 背景view
    private lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.hex("F5F5F5")
        self.configUI()
        self.contentView.addSubview(self.bgView)
        let vd: [String: UIView] = ["bgView": self.bgView]
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-12-[bgView]-12-|", options: [], metrics: nil, views: vd))
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[bgView]|", options: [], metrics: nil, views: vd))
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.bgView.cornerForView(conrners: .allCorners, radius: 12)
        self.mainImageView.cornerForView(conrners: .allCorners, radius: 8)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// 布局界面
    private func configUI() {
        self.bgView.addSubview(self.titlelab)
        self.bgView.addSubview(self.timeLab)
        self.bgView.addSubview(self.describeLab)
        self.describeLab.numberOfLines = 2
        self.bgView.addSubview(self.mainImageView)
        let vd: [String: UIView] = ["titlelab": titlelab , "timeLab": timeLab , "describeLab": describeLab , "mainImageView": mainImageView]
        self.bgView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-[mainImageView(100)]-[titlelab]-10-|", options: [], metrics: nil, views: vd))
        self.bgView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "[timeLab]-|", options: [], metrics: nil, views: vd))
        self.bgView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "[mainImageView]-[describeLab]-10-|", options: [], metrics: nil, views: vd))
        self.bgView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[mainImageView(100)]-30-|", options: [], metrics: nil, views: vd))
        self.bgView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[titlelab]-5-[describeLab]", options: [], metrics: nil, views: vd))
        self.bgView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[timeLab]-|", options: [], metrics: nil, views: vd))
    }
    
    /// 更新cell
    func updateCell(data: incidentBaseProtocol) {
        self.titlelab.text = data.titleIncident
        self.timeLab.text = data.timeIncident
        self.describeLab.text = data.describeIncident
    }
}






