//
//  NaviViewController.swift
//  iOSClub
//
//  Created by iMac01 on 2019/7/4.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit

class NaviViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
