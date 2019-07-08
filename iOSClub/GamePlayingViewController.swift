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
    var backgroundWrong = UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1.0)
    var backgroundRight = UIColor(displayP3Red: 0, green: 255, blue: 0, alpha: 1.0)
    var WeatherUserIsRight = false
    var score = 0
    var QuestionCount = 0
    var choosed = 0
    var presscount = 0
    @IBOutlet weak var AnswerImageRightBackground: UIView!
    @IBOutlet weak var AnswerImageLeftBackground: UIView!
    @IBOutlet weak var AfterAnswerLabel: UILabel!
    @IBOutlet weak var AnswerImageLeft: UIImageView!
    @IBOutlet weak var AnswerImageRight: UIImageView!
    @IBOutlet weak var OutcomeImageLeft: UIImageView!
    @IBOutlet weak var OutcomeImageRight: UIImageView!
    let duration = 0.8
    let durationOffset = -0.3
    
    @IBOutlet weak var ScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        choosed = 0
        presscount = 0
        ScoreLabel.text = String(score)
        index = Int.random(in: 0...Questions.count-1)
        SetQuestions(quiz: Questions[index])
        AnswerImageLeftBackground.backgroundColor = .white
        AnswerImageRightBackground.backgroundColor = .white
        OutcomeImageLeft.isHidden = true
        OutcomeImageRight.isHidden = true
        AfterAnswerLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBAction func ExitButton(_ sender: Any) {
        
        exit(0)
    }
    @IBAction func RefreshButton(_ sender: Any) {
        QuestionCount += 1
        if choosed == 0{
            let Action = UIAlertAction(title: "OK", style: .default, handler: nil)
            let Alert = UIAlertController(title: "等等！", message: "你還沒答題啊", preferredStyle: .alert)
            Alert.addAction(Action)
            present(Alert, animated: true, completion: nil)
        }else{
            if QuestionCount == 10{
                ToEndgameView()
            }
            self.viewDidLoad()
        }
        
    }
    func ToEndgameView(){
        let DisVC = storyboard?.instantiateViewController(withIdentifier: "EndGame") as! GameFinishViewController
        DisVC.data = String(score)
        score = 0
        QuestionCount = 0
        present(DisVC, animated: true,completion: nil)
    }
    
    @IBAction func CorrectOrIncorrectJudge1(_ sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 1
        sender.numberOfTouchesRequired = 1
        presscount += 1
        
        
        if(Questions[index].Name[0].contains("真")){
            OutcomeImageLeft.image = UIImage(named: "答對圖片")
            UIView.animate(withDuration: duration, animations: {() -> Void in
                self.AnswerImageLeftBackground.backgroundColor = self.backgroundRight
            })
            OutcomeImageRight.image = UIImage(named: "答錯圖片")
            UIView.animate(withDuration: duration - durationOffset, animations: {() -> Void in
                self.AnswerImageRightBackground.backgroundColor = self.backgroundWrong
            })
            WeatherUserIsRight = false
        }else{
            OutcomeImageLeft.image = UIImage(named: "答錯圖片")
            UIView.animate(withDuration: duration - durationOffset, animations: {() -> Void in
                self.AnswerImageLeftBackground.backgroundColor = self.backgroundWrong
            })
            OutcomeImageRight.image = UIImage(named: "答對圖片")
            UIView.animate(withDuration: duration, animations: {() -> Void in
                self.AnswerImageRightBackground.backgroundColor = self.backgroundRight
            })
            WeatherUserIsRight = true
        }
        if WeatherUserIsRight && choosed == 0 && presscount == 1{
            choosed = 1
            score += 100
        }else if !WeatherUserIsRight && choosed == 0 && presscount == 1{
            choosed = 1
        }
        ScoreLabel.text = String(score)
        OutcomeImageRight.isHidden = false
        OutcomeImageLeft.isHidden = false
        AfterAnswerLabel.isHidden = false
    }
    @IBAction func CorrectOrIncorrectJudge(_ sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 1
        sender.numberOfTouchesRequired = 1
        presscount += 1
        
        if(Questions[index].Name[0].contains("真")){
            OutcomeImageLeft.image = UIImage(named: "答對圖片")
            UIView.animate(withDuration: duration, animations: {() -> Void in
                self.AnswerImageLeftBackground.backgroundColor = self.backgroundRight
            })
            OutcomeImageRight.image = UIImage(named: "答錯圖片")
            UIView.animate(withDuration: duration - durationOffset, animations: {() -> Void in
                self.AnswerImageRightBackground.backgroundColor = self.backgroundWrong
            })
            WeatherUserIsRight = true
        }else{
            OutcomeImageLeft.image = UIImage(named: "答錯圖片")
            UIView.animate(withDuration: duration - durationOffset, animations: {() -> Void in
                self.AnswerImageLeftBackground.backgroundColor = self.backgroundWrong
            })
            OutcomeImageRight.image = UIImage(named: "答對圖片")
            UIView.animate(withDuration: duration, animations: {() -> Void in
                self.AnswerImageRightBackground.backgroundColor = self.backgroundRight
            })
            WeatherUserIsRight = false
        }
        if WeatherUserIsRight && choosed == 0 && presscount == 1{
            choosed = 1
            score += 100
        }else if !WeatherUserIsRight && choosed == 0 && presscount == 1{
            choosed = 1
        }
        ScoreLabel.text = String(score)
        OutcomeImageRight.isHidden = false
        OutcomeImageLeft.isHidden = false
        AfterAnswerLabel.isHidden = false
    }
    func SetQuestions(quiz:Quiz){
        AfterAnswerLabel.text = quiz.Description
        AfterAnswerLabel.sizeToFit()
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
