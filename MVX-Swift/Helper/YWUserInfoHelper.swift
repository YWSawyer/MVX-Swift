//
//  YWUserInfoHelper.swift
//  MVX-Swift
//
//  Created by dahuoshi on 04/09/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit

class YWUserInfoHelper: NSObject {
    
    var headView: YWInfoView!
    lazy var apiManager: YWRequestManager = {()-> YWRequestManager in
        let manager = YWRequestManager.shareManager
        return manager
    }()
    
    convenience init(infoView: YWInfoView) {
        self.init()
        headView = infoView
    }

    func loadData() {
        apiManager.getInfoData { (model: YWHeadInfoModel) in
            headView.headImage.image = UIImage(named: model.headImage!)
            headView.nameLbl.text    = model.userName
            headView.productCountLbl.text = "作品：\(model.productsCount!)"
            headView.friendCountLbl.text  = "好友：\(model.friendCount!)"
            headView.personalInfoLbl.text = "个人简介：\(model.personalInfo!)"
            
        }
    }
}
