//
//  YWRootController.swift
//  MVX-Swift
//
//  Created by dahuoshi on 29/08/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit

class YWRootController: UITableViewController {
    
    lazy var datas: [YWRcModel] = {() -> [YWRcModel] in
        var array: [YWRcModel] = [YWRcModel]()
        let names = ["MVC","MVP","MVVM"]
        let btn1Titles = ["查看他人信息","查看个人信息","查看个人信息"]
        let btn2Titles = ["查看个人信息","",""]
        for index in 0..<4 {
            let model = YWRcModel()
            model.name = names[index]
            model.btn1 = btn1Titles[index]
            model.btn2 = btn2Titles[index]
            array.append(model)
        }
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UITableViewDelegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    // MARK:- UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "rootCell"
        let model = datas[indexPath.row]
        var cell: YWRcCell? = tableView.dequeueReusableCell(withIdentifier: cellIndentifier) as? YWRcCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("YWRcCell", owner: nil, options: nil)?.last as? YWRcCell
        }
        cell?.nameLbl.text = model.name
        cell?.btnOne.setTitle(model.btn1, for: .normal)
        if indexPath.row == 2 {
            cell?.btnTwo.setTitle(model.btn2, for: .normal)
        }
        return cell!
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
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
