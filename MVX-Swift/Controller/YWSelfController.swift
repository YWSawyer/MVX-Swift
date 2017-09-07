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
    
    var draftTabView: UITableView!
    
    
    var infoHelper: YWUserInfoHelper!
    var blogHelper: YWBlogInfoHelper!
    var draftHelper: YWDraftInfoHelper!
    
    var infoView: YWInfoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        configInfoView()
        configBlogView()
        configDraftView()
    }
    
    func setupUI() {
        
        infoView = Bundle.main.loadNibNamed("YWInfoView", owner: nil, options: nil)?.last as? YWInfoView
        infoView.frame = userBackView.bounds
        userBackView.addSubview(infoView)
        draftTabView = UITableView(frame: CGRect.zero, style: .plain)
        self.view.addSubview(draftTabView)
        
        draftTabView.snp.makeConstraints { make in
            make.size.equalTo(self.blogTabView.snp.size)
            make.left.equalTo(self.blogTabView.snp.right)
            make.top.equalTo(self.blogTabView.snp.top)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.screenOrientationAction), name: .UIDeviceOrientationDidChange, object: nil)
        
    }
    
    func configInfoView() {
        infoHelper = YWUserInfoHelper(infoView: infoView)
        infoHelper.loadData()
    }
    
    func configBlogView() {
        blogHelper = YWBlogInfoHelper(tableView: self.blogTabView)
        blogHelper.loadBlogData()
        
    }

    func configDraftView() {
        draftHelper = YWDraftInfoHelper(tableView: self.draftTabView)
        draftHelper.loadBlogData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func blogBtnAction(_ sender: Any) {
        self.blogBtn.setTitleColor(UIColor.red, for: .normal)
        self.draftBtn.setTitleColor(UIColor.black, for: .normal)
        self.blogTabView.snp.updateConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func draftBtnAction(_ sender: Any) {
        self.blogBtn.setTitleColor(UIColor.black, for: .normal)
        self.draftBtn.setTitleColor(UIColor.red, for: .normal)
        self.blogTabView.snp.updateConstraints { make in
            make.leading.equalToSuperview().offset(-self.view.frame.size.width)
            make.trailing.equalToSuperview().offset(-self.view.frame.size.width)
        }
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    override func updateViewConstraints() {
        
        super.updateViewConstraints()
    }
    
    @objc func screenOrientationAction() {
        let orientation = UIDevice.current.orientation
        if (self.blogTabView.frame.origin.x<0) && (orientation == .landscapeLeft || orientation == .landscapeRight) {
            self.blogTabView.snp.updateConstraints { make in
                make.leading.equalToSuperview().offset(-self.view.frame.size.width)
                make.trailing.equalToSuperview().offset(-self.view.frame.size.width)
            }
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }else if (orientation == .portrait) {
            if (self.blogTabView.frame.origin.x>=0) {
                self.blogTabView.snp.updateConstraints { make in
                    make.leading.equalToSuperview()
                    make.trailing.equalToSuperview()
                }
            }else {
                self.blogTabView.snp.updateConstraints { make in
                    make.leading.equalToSuperview().offset(-self.view.frame.size.width)
                    make.trailing.equalToSuperview().offset(-self.view.frame.size.width)
                }
            }
            
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
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
