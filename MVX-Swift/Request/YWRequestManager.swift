//
//  YWRequestManager.swift
//  MVX-Swift
//
//  Created by dahuoshi on 04/09/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit

typealias block = (_ datas: NSData)-> Void

class YWRequestManager: NSObject {
    
    static let shareManager: YWRequestManager = YWRequestManager()
    
    private override init() {
        super.init()
    }
    
    func getInfoData(completion: ((_ model: YWHeadInfoModel)->Void)) {
        let data = YWHeadInfoModel()
        data.friendCount = String(8)
        data.headImage   = "icon0"
        data.productsCount = String(3)
        data.personalInfo = "喜欢吹牛逼"
    }
}
