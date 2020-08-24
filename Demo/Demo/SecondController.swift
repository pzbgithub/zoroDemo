//
//  SecondController.swift
//  Demo
//
//  Created by zoro on 2020/8/14.
//  Copyright © 2020 zoro. All rights reserved.
//

import UIKit

class SecondController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    static var countTest = 0
    
    lazy var tableHeader: UIView = {
        let tableHeader = UIView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100))
        tableHeader.backgroundColor = .yellow
        return tableHeader
    }()
    
    lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .white
        table.rowHeight = 44
        table.delegate = self
        table.dataSource = self
        table.tableHeaderView = tableHeader
        table.sectionHeaderHeight = 44
        return table
    }()
    
    lazy var guideView: YYGuideLoginView = {
       let guideView = YYGuideLoginView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
       guideView.backgroundColor = .cyan
        return guideView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "非首页"
        
        self.view.addSubview(table)
        
        table.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    deinit {
        print("sssssssssssssss")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellid)
        }
        
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return guideView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(SecondController(), animated: true)
    }
    
    

}
