//
//  GamePlayingViewController.swift
//  iOSClub
//
//  Created by 黃威愷 on 2019/7/4.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import UIKit

class GamePlayingViewController: UIViewController {
    
    @IBOutlet weak var AnswerImageRightBackground: UIView!
    @IBOutlet weak var AnswerImageLeftBackground: UIView!
    @IBOutlet weak var AfterAnswerLabel: UILabel!
    @IBOutlet weak var AnswerImageLeft: UIImageView!
    
    @IBOutlet weak var AnswerImageRight: UIImageView!
    
    @IBOutlet weak var OutcomeImageLeft: UIImageView!
    @IBOutlet weak var OutcomeImageRight: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func ExitButton(_ sender: Any) {
        exit(0)
    }
    
    @IBAction func RefreshButton(_ sender: Any) {
        
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
