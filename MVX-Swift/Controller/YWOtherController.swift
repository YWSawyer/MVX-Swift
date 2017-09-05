//
//  YWOtherController.swift
//  MVX-Swift
//
//  Created by dahuoshi on 31/08/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit

class YWOtherController: UIViewController {

    @IBOutlet weak var userBackView: UIView!
    @IBOutlet weak var tabView: UITableView!
    
    var infoHelper: YWUserInfoHelper!
    var blogHelper: YWBlogInfoHelper!
    var infoView: YWInfoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        configInfoView()
        configBlogView()
    }
    
    func setupUI() {
        
        infoView = Bundle.main.loadNibNamed("YWInfoView", owner: nil, options: nil)?.last as? YWInfoView
        infoView.frame = userBackView.bounds
        userBackView.addSubview(infoView)
    }

    func configInfoView() {
        infoHelper = YWUserInfoHelper(infoView: infoView)
        infoHelper.loadData()
    }
    
    func configBlogView() {
        blogHelper = YWBlogInfoHelper(tableView: self.tabView)
        blogHelper.loadBlogData()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
