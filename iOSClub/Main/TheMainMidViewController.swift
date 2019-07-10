//
//  TheMainMidViewController.swift
//  iOSClub
//
//  Created by iMac01 on 2019/7/4.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit

class TheMainMidViewController: UIViewController,UIScrollViewDelegate{
    
    lazy var AboutUsViewController:AboutUsViewController = {
        return UIStoryboard(name: "AboutUsStoryboard", bundle: nil).instantiateViewController(withIdentifier: "AboutUsStoryboardID") as! AboutUsViewController
    }()
     var CurriculumViewController:curriculumStoryboardCollectionViewController = {
        return UIStoryboard(name: "curriculumStoryboard", bundle: nil).instantiateViewController(withIdentifier: "curriculumStoryboard") as! curriculumStoryboardCollectionViewController
    }()
    lazy var ActivityViewController:ActivityViewController = {
        return UIStoryboard(name: "ActivityStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ActivityStoryboardVC") as! ActivityViewController
    }()
    lazy var GameViewController:GameViewController = {
        return UIStoryboard(name: "GameStoryboard", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
    }()
    lazy var XcodeViewController:UITableViewController = {
        return UIStoryboard(name: "xcodeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "xcodeVC") as! UITableViewController
    }()
    
    @IBAction func MenuActions(_ sender: Any) {
        self.MenuButtons[previousButton].backgroundColor = self.MenuView.backgroundColor
        guard let button = sender as? UIButton else {
            return
        }
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.restrictRotation = .portrait
        }
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        self.navigationItem.title = button.titleLabel?.text
        
        previousButton = button.tag
        
        switch button.tag {
        case 0:
            self.navigationItem.title = "iOS Club"
            changeContainer(to: HomeViewController)
            button.backgroundColor = selectButtonColor
            break
        case 3:
            changeContainer(to: ActivityViewController)
            button.backgroundColor = selectButtonColor
            break
        case 4:
            changeContainer(to: CurriculumViewController)
            button.backgroundColor = selectButtonColor
            break
        case 7:
            changeContainer(to: XcodeViewController)
            button.backgroundColor = selectButtonColor
            break
        case 8:
            self.navigationController?.isNavigationBarHidden = true
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.restrictRotation = .landscapeRight
            }
            let value = UIInterfaceOrientation.landscapeRight.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            changeContainer(to: GameViewController)
            button.backgroundColor = selectButtonColor
            
            break
        case 9:
            changeContainer(to: AboutUsViewController)
            button.backgroundColor = selectButtonColor
            break
        default:
            changeContainer(to: HomeViewController)
            button.backgroundColor = selectButtonColor
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
//    override var shouldAutorotate: Bool {
//        return true
//    }
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
//        return .landscapeRight
//    }
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
        self.containerView.setNeedsLayout()
        self.containerView.layoutIfNeeded()
        self.MenuView.setNeedsLayout()
        self.MenuView.layoutIfNeeded()
        
        self.containerView.center.x -= self.MenuView.frame.width
        self.containerView.alpha = 0.2
        self.selectedViewController = newViewController
    }
    
    override func viewDidLoad() {
        self.MenuButtons[0].backgroundColor = selectButtonColor
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
    @IBOutlet var MenuButtons: [UIButton]!
    @IBOutlet var editProfileButton: UIButton!
    @IBOutlet var logoutButton: UIButton!
    
    var previousButton = 0
    var MenuChange = 0
    var MenuXpos = 0
    var selectedViewController:UIViewController = UIViewController()
    var HomeViewController:TheMainTableViewController = TheMainTableViewController()
    let selectButtonColor = UIColor(red: 244/255, green: 158/255, blue: 39/255, alpha: 1)
    
    override func viewWillAppear(_ animated: Bool) {
        MenuView.alpha = 0
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContainerSegue"{
            HomeViewController = segue.destination as! TheMainTableViewController
        }
        print(123)
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
