//
//  SwiftViewController.swift
//  LoadResouse
//
//  Created by zhugy on 2017/3/15.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

import UIKit
import Cartography

class SwiftViewController: UIViewController {

    internal let items: [Item] = [.blueTouch, .js, .animation,.test]
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor.gray
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Swift"
        view.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        
    }
    private func setTableView() {
        view.addSubview(tableView)
        constrain(tableView) { (tableView) in
            tableView.leading == tableView.superview!.leading
            tableView.trailing == tableView.superview!.trailing
            tableView.top == tableView.superview!.top
            tableView.bottom == tableView.superview!.bottom
        }
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SwiftViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        switch item {
        case .blueTouch:
            navigationController?.pushViewController(BlueTouchViewController(), animated: true)
        case .js:
            navigationController?.pushViewController(JSViewController(), animated: true)
        case .test:
            navigationController?.pushViewController(PPTestViewController(), animated: true)
        case .animation:
            navigationController?.pushViewController(AnimationViewController(), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension SwiftViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = item.title
        return cell
    }
}

extension SwiftViewController {
    enum Item {
        case blueTouch
        case js
        case test
        case animation
        
        var title: String {
            switch self {
            case .blueTouch:
                return "蓝牙"
            case .js:
                return "JS交互"
            case .test:
                return "测试"
            case .animation:
                return "动画"
            }
        }
    }
}
