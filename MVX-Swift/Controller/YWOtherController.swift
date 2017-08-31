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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userView: YWInfoView? = Bundle.main.loadNibNamed("YWInfoView", owner: nil, options: nil)?.last as? YWInfoView
        userView!.frame = userBackView.bounds
        userBackView.addSubview(userView!)
        userBackView.backgroundColor = UIColor.lightGray
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
