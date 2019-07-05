//
//  TheMainMidViewController.swift
//  iOSClub
//
//  Created by iMac01 on 2019/7/4.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit

class TheMainMidViewController: UIViewController {

    override func viewDidLoad() {
        self.MenuXpos = Int(UIScreen.main.bounds.width + self.MenuView.frame.width / 2 + 1)
        
        super.viewDidLoad()
        
        self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.width / 2
        self.profilePicture.clipsToBounds = true
        
        self.logoutButton.layer.borderWidth = 1
        self.logoutButton.layer.borderColor = UIColor.white.cgColor
        self.logoutButton.layer.cornerRadius = 5
        
        self.editProfileButton.layer.borderWidth = 1
        self.editProfileButton.layer.borderColor = UIColor.white.cgColor
        self.editProfileButton.layer.cornerRadius = 5
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clickMenu(_ sender: Any) {
        MenuView.center.x = CGFloat(self.MenuXpos)
        if MenuChange == 0{
            UIView.animate(withDuration: 0.4){
                self.containerView.center.x -= self.MenuView.frame.width
                self.MenuView.isHidden = false
                self.MenuView.center.x -= self.MenuView.frame.width
                self.MenuXpos -= Int(self.MenuView.frame.width)
                
            }
            MenuChange = 1
        }else{
            UIView.animate(withDuration: 0.4){
                self.containerView.center.x += self.MenuView.frame.width
                
                self.MenuView.center.x += self.MenuView.frame.width
                self.MenuXpos += Int(self.MenuView.frame.width)
            }
            MenuChange = 0
        }
    }
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var profilePicture: UIImageView!
    var MenuChange = 0
    var MenuXpos = 0
    
    
    @IBOutlet var editProfileButton: UIButton!
    @IBOutlet var logoutButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        MenuView.isHidden = true
        
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
