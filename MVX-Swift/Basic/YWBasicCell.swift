//
//  YWBasicCell.swift
//  MVX-Swift
//
//  Created by dahuoshi on 04/09/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit

class YWBasicCell: UITableViewCell {

    var tabview: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func loadNibCellFor(tabView: UITableView, nibName: String) -> YWBasicCell? {
        let cell = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.last as? YWBasicCell
        cell?.tabview = tabView
        return cell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
