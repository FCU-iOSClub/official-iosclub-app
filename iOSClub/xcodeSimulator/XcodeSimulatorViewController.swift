//
//  XcodeSimulatorViewController.swift
//  iOSClub
//
//  Created by 黃威愷 on 2019/7/9.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import UIKit

class XcodeSimulatorViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var ChangeLabel: UILabel!
    var FontName:String = "Courier"
    var FontSize:CGFloat = 30.0
    var descriptions = ["更改文字內容","更改文字顏色","更改文字透明度","調整文字字型","調整文字大小"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptions.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Description", for: indexPath)
        cell.textLabel?.text = descriptions[indexPath.row]
        return cell
    }
    
    func MessageConversion(Title:String,Size:CGFloat,Font:String) -> Any{
        let font = [NSAttributedString.Key.font: UIFont(name: Font, size: Size)!]
        let message = NSMutableAttributedString(string: Title, attributes: font)
        return message
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        func ColorAction(Color:UIColor,Title:String) -> UIAlertAction{
            let button = UIAlertAction(title: Title, style: .default, handler: {(act) -> Void in
                self.ChangeLabel.textColor = Color
            })
            button.setValue(Color, forKey: "titleTextColor")
            return button
        }
        func FontAction(Font:String) -> UIAlertAction{
            let button = UIAlertAction(title: Font, style: .default, handler: {(act) -> Void in
                self.FontName = Font
                self.ChangeLabel.font = UIFont(name: Font, size: self.FontSize)
                self.ChangeLabel.sizeToFit()
            })
            return button
        }
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
                
        switch indexPath.row {
        case 0:
            alert.setValue(MessageConversion(Title: "Label.text = _____________", Size: 30.0,Font: "ArialHebrew-Bold"), forKey: "attributedTitle")
            alert.addTextField{(textField) -> Void in
                textField.placeholder = "顯示文字"
                textField.enablesReturnKeyAutomatically = true
            }
            
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(ale) -> Void in
                self.ChangeLabel.text = alert.textFields![0].text
                self.ChangeLabel.sizeToFit()
            }))
            break
        case 1:
            alert.setValue(MessageConversion(Title: "Label.textColor = _____________", Size: FontSize,Font: "ArialHebrew-Bold"), forKey: "attributedTitle")
            alert.addAction(ColorAction(Color: .orange, Title: ".orange"))
            alert.addAction(ColorAction(Color: .blue, Title: ".blue"))
            alert.addAction(ColorAction(Color: .red, Title: ".red"))
            alert.addAction(ColorAction(Color: .green, Title: ".green"))
        case 2:
            alert.setValue(MessageConversion(Title: "Label.alpha = _____________\n請輸入介於0.0~1.0的數值", Size: 30.0,Font: "ArialHebrew-Bold"), forKey: "attributedTitle")
            alert.addTextField{(textField) -> Void in
                textField.placeholder = "0.0~1.0的數值"
                textField.keyboardType = .decimalPad
                textField.enablesReturnKeyAutomatically = true
            }
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(ale) -> Void in
                if alert.textFields![0].text == ""{
                    return
                }
                if let input = alert.textFields![0].text{
                    if let textAlphaValue = Float(input){
                        if (textAlphaValue >= 0 && textAlphaValue <= 1.0){
                            self.ChangeLabel.alpha = CGFloat(textAlphaValue)
                        }else{
                            let WrongAlert = UIAlertController(title: "警告", message: "請輸入正確的數值", preferredStyle: .alert)
                            //                        WrongAlert.setValue(self.MessageConversion(Title: "請輸入正確的數值！", Size: 20.0, Font: "ArialHebrew-Bold"), forKey: "attributedTitle")
                            WrongAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(WrongAlert, animated: true, completion: nil)
                        }
                    }
                    else {
                        EZAlertController.alert("錯誤!", message: "輸入值只能介於0.0~1.0的數值")
                    }
                }
                
            }))
        case 3:
            alert.setValue(MessageConversion(Title: "Label.font = UIFont(name:______,size:\(Float(FontSize)))", Size: 30.0,Font: "ArialHebrew-Bold"), forKey: "attributedTitle")
            alert.addAction(FontAction(Font: "AvenirNextCondensed-Regular"))
            alert.addAction(FontAction(Font: "ChalkboardSE-Regular"))
            alert.addAction(FontAction(Font: "Helvetica"))
        case 4:
            alert.setValue(MessageConversion(Title: "Label.font = UIFont(name:\(FontName),size:______)", Size: 30.0,Font: "ArialHebrew-Bold"), forKey: "attributedTitle")
            alert.addTextField{(textField) -> Void in
                textField.placeholder = "輸入數字"
                textField.keyboardType = .numberPad
                textField.enablesReturnKeyAutomatically = true
            }
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(ale) -> Void in
                if alert.textFields![0].text == ""{
                    return
                }
                if let inputnumber = alert.textFields![0].text{
                    if let fontSize = Float(inputnumber){
                        self.FontSize = CGFloat(fontSize)
                    }
                    else{
                        EZAlertController.alert("錯誤!", message: "輸入值只能為數字")
                    }
                }
                //self.FontSize = CGFloat(Float(alert.textFields![0].text!)!)
                self.ChangeLabel.font = UIFont(name: self.FontName, size: self.FontSize)
                self.ChangeLabel.sizeToFit()
            }))
            
        default:
            break
        }
        present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var ListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ListTable.delegate = self
        ListTable.dataSource = self
        // Do any additional setup after loading the view.
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
