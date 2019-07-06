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
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let frame = self.navigationController?.navigationBar.frame
        
        
        let height: CGFloat = 200
        let bounds = self.navigationController?.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: (frame?.origin.x)!, y: (frame?.origin.y)!, width: (bounds?.width)!, height: (bounds?.height)! + height)
    }
    */
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
