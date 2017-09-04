//
//  YWRootController.swift
//  MVX-Swift
//
//  Created by dahuoshi on 29/08/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit

class YWRootController: UITableViewController,CellDelegate {
   
    lazy var datas: [YWRcModel] = {() -> [YWRcModel] in
        var array: [YWRcModel] = [YWRcModel]()
        let names = ["MVC","MVP","MVVM"]
        let btn1Titles = ["查看他人信息","查看个人信息","查看个人信息"]
        let btn2Titles = ["查看个人信息","",""]
        for index in 0..<3 {
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
        self.tableView.tableFooterView = UIView()
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
            cell = YWRcCell.loadNibCellFor(tabView: tableView, nibName: "YWRcCell") as? YWRcCell
            cell?.delegate = self
            cell?.selectionStyle = .none
        }
        cell?.nameLbl.text = model.name
        cell?.btnOne.setTitle(model.btn1, for: .normal)
        switch indexPath.row {
        case 0:
            cell?.btnTwo.setTitle(model.btn2, for: .normal)
            cell?.backgroundColor = UIColor.lightGray
        case 1:
            cell?.btnTwo.isHidden = true
            cell?.backgroundColor = UIColor.orange
        case 2:
            cell?.btnTwo.isHidden = true
            cell?.backgroundColor = UIColor.yellow
        default:
            break
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    //MARK: -YWRcCellDelegate

    func didSelectButtonIn(tableView: UITableView, cellName: String, btnIndex: NSInteger) {
        print("name:\(cellName) index:\(btnIndex)")
        pushDestinationController(cellName: cellName, index: btnIndex)
    }
    
    
    func pushDestinationController(cellName: String, index: NSInteger){
        switch cellName {
        case "MVC":
            if index == 1 {
                self.performSegue(withIdentifier: "mvcOtherIdentifier", sender: nil)
            }else{
                self.performSegue(withIdentifier: "mvcSelfIdentifier", sender: nil)
            }
        default:
            print("sdg")
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
