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
        //
    }
}
