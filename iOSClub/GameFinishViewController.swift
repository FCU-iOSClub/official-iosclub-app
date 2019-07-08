//
//  GameFinishViewController.swift
//  iOSClub
//
//  Created by 黃威愷 on 2019/7/6.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import UIKit

class GameFinishViewController: UIViewController {
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBAction func AgainButton(_ sender: Any) {
        
        dismiss(animated: false, completion: nil)
    }
    @IBAction func ExitButton(_ sender: Any) {
        exit(0)
    }
    var data = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreLabel.text = data
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackToMainMenu(_ sender: Any) {
        let DestVC = storyboard?.instantiateViewController(withIdentifier: "GameViewController")
        present(DestVC!, animated: false, completion: nil)
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
