//
//  HomeMainViewController.swift
//  RecordKnots
//
//  Created by 张冬 on 2018/9/10.
//  Copyright © 2018年 张冬. All rights reserved.
//

import UIKit

/**
 *  首页的主控制器
 */
class HomeMainViewController: BaseViewController {
    
    /// 显示首页列表的lab
    private lazy var tableView: UITableView = {
        let t = UITableView(frame: CGRect.zero, style: .plain)
        t.translatesAutoresizingMaskIntoConstraints = false
        t.separatorStyle = .none
        t.delegate = self
        t.dataSource = self
        return t
    }()
    /// 数据源
    private var dataArr: [HomeIncidentStruct] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.setNavTitle(title: "首页")
        self.configUI()
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -
    /// 加载数据
    private func loadData() {
        let titleArr: [String] = ["不想上班" , "明天去上网" , "明天发工资" , "明天不上班" , "明天周末"]
        let destricsArr: [String] = ["泛型能够让开发者编写自定义需求已经任意类型的灵活可用的的函数和类型" , "泛型能够让开发者编写自定义需求已经任意类型的灵活可用的的函数和类型" , "泛型能够让开发者编写自定义需求已经任意类型的灵活可用的的函数和类型" , "泛型能够让开发者编写自定义需求已经任意类型的灵活可用的的函数和类型" , "泛型能够让开发者编写自定义需求已经任意类型的灵活可用的的函数和类型" ]
        var tempArr: [HomeIncidentStruct] = []
        for i in 0 ... titleArr.count - 1 {
            tempArr.append(HomeIncidentStruct(idIncident: "111", titleIncident: titleArr[i], timeIncident: "2018-09-01 12:59", describeIncident: destricsArr[i], imageUrl: nil))
        }
        self.dataArr = tempArr
    }
    
    // 布局界面
    private func configUI() {
        self.view.addSubview(self.tableView)
        let vd: [String: UIView] = ["tableView": self.tableView]
        self.tableView.register(HomeMainTableViewCell.classForCoder(), forCellReuseIdentifier: "homeCell")
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[tableView]|", options: [], metrics: nil, views: vd))
        if #available(iOS 11.0, *) {
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            // Fallback on earlier versions
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        }
    }
}

// MARK: - 实现tableview的代理方法
extension HomeMainViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeMainTableViewCell
        cell.updateCell(data: self.dataArr[indexPath.row])
        return cell
    }
}













