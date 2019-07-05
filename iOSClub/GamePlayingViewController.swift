//
//  GamePlayingViewController.swift
//  iOSClub
//
//  Created by 黃威愷 on 2019/7/5.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import UIKit

class GamePlayingViewController: UIViewController {
    var Questions:[Quiz] = [Quiz(name:"Google",description: "字母的顏色錯了"),Quiz(name:"百事",description: "紅藍傻傻分不清"),Quiz(name: "Windows",description: "想不到吧～顏色對調啦！"),Quiz(name:"Nestle",description: "鳥只有兩隻啦"),Quiz(name:"BMW",description: "藍白顏色對調了"),Quiz(name:"mutella",description: "雀巢飲料真好喝")]
    var index = 0
    
    @IBOutlet weak var AnswerImageRightBackground: UIView!
    @IBOutlet weak var AnswerImageLeftBackground: UIView!
    @IBOutlet weak var AfterAnswerLabel: UILabel!
    @IBOutlet weak var AnswerImageLeft: UIImageView!
    @IBOutlet weak var AnswerImageRight: UIImageView!
    @IBOutlet weak var OutcomeImageLeft: UIImageView!
    @IBOutlet weak var OutcomeImageRight: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        index = Int.random(in: 0...Questions.count-1)
        SetQuestions(quiz: Questions[index])
        AnswerImageLeftBackground.backgroundColor = .darkGray
        AnswerImageRightBackground.backgroundColor = .darkGray
        OutcomeImageLeft.isHidden = true
        OutcomeImageRight.isHidden = true
        AfterAnswerLabel.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    @IBAction func ExitButton(_ sender: Any) {
        
        exit(0)
    }
    @IBAction func RefreshButton(_ sender: Any) {
        self.viewDidLoad()
    }
    
    @IBAction func CorrectOrIncorrectJudge1(_ sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 1
        sender.numberOfTouchesRequired = 1
        if(sender.state == .began){
            if(Questions[index].Name[0].contains("真")){
                OutcomeImageLeft.image = UIImage(named: "答對圖片")
                OutcomeImageRight.image = UIImage(named: "答錯圖片")
            }else{
                OutcomeImageLeft.image = UIImage(named: "答錯圖片")
                OutcomeImageRight.image = UIImage(named: "答對圖片")
            }
        }
        OutcomeImageRight.isHidden = false
        OutcomeImageLeft.isHidden = false
        AfterAnswerLabel.isHidden = false
    }
    @IBAction func CorrectOrIncorrectJudge(_ sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 1
        sender.numberOfTouchesRequired = 1
        if(Questions[index].Name[0].contains("真")){
            OutcomeImageLeft.image = UIImage(named: "答對圖片")
            OutcomeImageRight.image = UIImage(named: "答錯圖片")
        }else{
            OutcomeImageLeft.image = UIImage(named: "答錯圖片")
            OutcomeImageRight.image = UIImage(named: "答對圖片")
        }
        OutcomeImageRight.isHidden = false
        OutcomeImageLeft.isHidden = false
        AfterAnswerLabel.isHidden = false
    }
    func SetQuestions(quiz:Quiz){
        AfterAnswerLabel.text = quiz.Description
        AnswerImageLeft.image = UIImage(named: quiz.Name[0])
        AnswerImageRight.image = UIImage(named: quiz.Name[1])
        quiz.SetFlagToUsed()
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
