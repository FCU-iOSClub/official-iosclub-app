//
//  GameViewController.swift
//  iOSClub
//
//  Created by 劉祐炘 on 2019/7/4.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //(UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ExitButton(_ sender: Any) {
//        let MainVC = UIStoryboard(name: "TheMainStoryboard", bundle:nil).instantiateViewController(withIdentifier: "TheMainMidStoryBoard") as! TheMainMidViewController
//        print(456)
//         MainVC.changeContainer(to: MainVC.HomeViewController)
//        if let delegate = UIApplication.shared.delegate as? AppDelegate {
//            delegate.restrictRotation = .portrait
//        }
//
//        let value = UIInterfaceOrientation.portrait
//        UIDevice.current.setValue(value, forKey: "orientation")
        exit(0)
       
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
