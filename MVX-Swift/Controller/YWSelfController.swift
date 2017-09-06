//
//  YWSelfController.swift
//  MVX-Swift
//
//  Created by dahuoshi on 06/09/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit
import SnapKit

class YWSelfController: UIViewController {

    @IBOutlet weak var userBackView: UIView!
    @IBOutlet weak var blogBtn: UIButton!
    @IBOutlet weak var draftBtn: UIButton!
    @IBOutlet weak var blogTabView: UITableView!
    
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
        blogHelper = YWBlogInfoHelper(tableView: self.blogTabView)
        blogHelper.loadBlogData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func blogBtnAction(_ sender: Any) {
        self.blogBtn.setTitleColor(UIColor.red, for: .normal)
        self.draftBtn.setTitleColor(UIColor.black, for: .normal)
        
    }
    
    @IBAction func draftBtnAction(_ sender: Any) {
        self.blogBtn.setTitleColor(UIColor.black, for: .normal)
        self.draftBtn.setTitleColor(UIColor.red, for: .normal)
        
    }
    
    override func updateViewConstraints() {
        self.blogTabView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(-300)
            make.trailing.equalToSuperview().offset(300)
        }
        super.updateViewConstraints()
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
