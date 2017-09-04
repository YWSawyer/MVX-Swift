//
//  YWOtherController.swift
//  MVX-Swift
//
//  Created by dahuoshi on 31/08/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit

class YWOtherController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var userBackView: UIView!
    @IBOutlet weak var tabView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userView: YWInfoView? = Bundle.main.loadNibNamed("YWInfoView", owner: nil, options: nil)?.last as? YWInfoView
        userView!.frame = userBackView.bounds
        userBackView.addSubview(userView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // MARK: - TableViewDatasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
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
