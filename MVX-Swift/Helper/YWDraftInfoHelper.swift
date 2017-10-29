
//
//  YWDraftInfoHelper.swift
//  MVX-Swift
//
//  Created by dahuoshi on 07/09/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit

class YWDraftInfoHelper: NSObject,UITableViewDataSource,UITableViewDelegate {

    var tabview: UITableView!
    var apiManager: YWRequestManager = {()->YWRequestManager in
        let manager = YWRequestManager.shareManager
        return manager
        
    }()
    //变化2
    var datas: [YWBlogInfoModel]?
    convenience init(tableView: UITableView) {
        self.init()
        self.tabview = tableView
        self.tabview.delegate = self
        self.tabview.dataSource = self
        self.tabview.tableFooterView = UIView()
        
    }
    
    func loadBlogData() {
        apiManager.getBlogInfo { (datas: [YWBlogInfoModel]) in
            self.datas = datas
            self.tabview.reloadData()
        }
    }
    
    //MARK: - UITableViewDelegate
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "blogCellIdentifier"
        var cell: YWInfoCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? YWInfoCell
        if cell == nil {
            cell = YWInfoCell.loadNibCellFor(tabView: tableView, nibName: "YWInfoCell") as? YWInfoCell
            cell?.selectionStyle = .none
        }
        let model = self.datas![indexPath.row]
        cell?.titleLbl.text = model.blogTitle
        cell?.infoLbl.text  = model.blogDigest
        cell?.praiseBtn.isHidden = true
        cell?.shareBtn.isHidden = true
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
