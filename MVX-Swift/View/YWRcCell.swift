//
//  YWRcCell.swift
//  MVX-Swift
//
//  Created by dahuoshi on 31/08/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit

@objc protocol CellDelegate: NSObjectProtocol {
   func didSelectButtonIn(tableView: UITableView, cellName: String, btnIndex: NSInteger)
}

class YWRcCell: YWBasicCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    
    weak var delegate: CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btn1Action(_ sender: UIButton) {
        if delegate?.responds(to: #selector(delegate?.didSelectButtonIn(tableView:cellName:btnIndex:))) != nil {
            delegate!.didSelectButtonIn(tableView: tabview, cellName: nameLbl.text!, btnIndex: 1)
        }
    }
    
    
    @IBAction func btn2Action(_ sender: UIButton) {
        if delegate?.responds(to: #selector(delegate?.didSelectButtonIn(tableView:cellName:btnIndex:))) != nil {
            delegate?.didSelectButtonIn(tableView: tabview, cellName: nameLbl.text!, btnIndex: 2)
        }
    }
    
}
