//
//  TheMainMidViewController.swift
//  iOSClub
//
//  Created by iMac01 on 2019/7/4.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit

class TheMainMidViewController: UIViewController,UIScrollViewDelegate{
    
    var selectedViewController:UIViewController = UIViewController()
    var HomeViewController:TheMainTableViewController = TheMainTableViewController()
    lazy var AboutUsViewController:AboutUsViewController = {
        return UIStoryboard(name: "AboutUsStoryboard", bundle: nil).instantiateViewController(withIdentifier: "AboutUsStoryboardID") as! AboutUsViewController
    }()
    lazy var CurriculumViewController:curriculumStoryboardCollectionViewController = {
        return UIStoryboard(name: "curriculumStoryboard", bundle: nil).instantiateViewController(withIdentifier: "curriculumStoryboard") as! curriculumStoryboardCollectionViewController
    }()
    lazy var ActivityViewController:ActivityViewController = {
        return UIStoryboard(name: "ActivityStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ActivityStoryboardVC") as! ActivityViewController
    }()
    lazy var GameViewController:GameViewController = {
        return UIStoryboard(name: "GameStoryboard", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
    }()
    @IBAction func MenuActions(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 0:
            changeContainer(to: HomeViewController)
            break
        case 3:
            changeContainer(to: ActivityViewController)
            break
        case 4:
            changeContainer(to: CurriculumViewController)
            break
        case 8:
            changeContainer(to: GameViewController)
            break
        default:
            changeContainer(to: HomeViewController)
            break
        }
        UIView.animate(withDuration: 0.4){
            self.containerView.center.x += self.MenuView.frame.width
            self.MenuView.alpha = 0
            self.containerView.alpha = 1
            self.MenuView.center.x += self.MenuView.frame.width
        }
        self.MenuXpos += Int(self.MenuView.frame.width)
        MenuChange = 0
        
    }
    func changeContainer(to newViewController:UIViewController){
        if self.selectedViewController == newViewController{
            return
        }
        self.selectedViewController.willMove(toParent: nil)
        self.selectedViewController.view.removeFromSuperview()
        self.selectedViewController.removeFromParent()
        
        self.addChild(newViewController)
        self.containerView.addSubview(newViewController.view)
        newViewController.view.frame = self.containerView.bounds
        newViewController.didMove(toParent: self)
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        
        self.containerView.center.x -= self.MenuView.frame.width
        self.containerView.alpha = 0.2
        self.selectedViewController = newViewController
    }
    
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
                self.MenuView.alpha = 1
                self.containerView.alpha = 0.2
                self.MenuView.center.x -= self.MenuView.frame.width
            }
            self.MenuXpos -= Int(self.MenuView.frame.width)
            MenuChange = 1
        }else{
            UIView.animate(withDuration: 0.4){
                self.containerView.center.x += self.MenuView.frame.width
                self.MenuView.alpha = 0
                self.containerView.alpha = 1
                self.MenuView.center.x += self.MenuView.frame.width
            }
            self.MenuXpos += Int(self.MenuView.frame.width)
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
        MenuView.alpha = 0
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContainerSegue"{
            HomeViewController = segue.destination as! TheMainTableViewController
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
