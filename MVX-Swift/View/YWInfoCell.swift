//
//  YWInfoCell.swift
//  MVX-Swift
//
//  Created by dahuoshi on 04/09/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//

import UIKit

class YWInfoCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var praiseBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
