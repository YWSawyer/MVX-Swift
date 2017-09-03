//
//  YWRcCell.swift
//  MVX-Swift
//
//  Created by dahuoshi on 31/08/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit

@objc protocol CellDelegate: NSObjectProtocol {
  @objc func didSelectButtonIn(tableView: UITableView, cellName: String, btnIndex: NSInteger)
}

class YWRcCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    var delegate: CellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func btn1Action() {
        if delegate?.responds(to: #selector(delegate?.didSelectButtonIn(tableView:cellName:btnIndex:))) != nil {
            print("")
        }
    }
  
    
}
