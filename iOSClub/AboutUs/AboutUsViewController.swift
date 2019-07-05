//
//  AboutUsViewController.swift
//  iOSClub
//
//  Created by Admin02 on 2019/7/4.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var cadre:[[Cadre]] = [
        [Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。")],
        [Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。")]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return cadre.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return "現任幹部（第三屆）"
        case 1:
            return "第二屆"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutUsCell", for: indexPath) as! AboutUsTableViewCell
        cell.photo.image = UIImage(named:cadre[indexPath.section][indexPath.row].photo)
        cell.position.text = cadre[indexPath.section][indexPath.row].position
        cell.name.text = cadre[indexPath.section][indexPath.row].name
        cell.introduce.text = cadre[indexPath.section][indexPath.row].introduce
        
        return cell
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
