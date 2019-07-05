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
        [Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。"),
        Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。"),
        Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。"),
        Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。"),Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。")],
        [Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。"),
        Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。"),
        Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。"),
        Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。")],
        [Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。"),
         Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。"),
         Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。"),
         Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。")]
    ]
    var expand = [1, 0, 0]
    var cellHeight = 0
    var sectionTitle = ["現任幹部（第三屆）", "第二屆", "第三屆"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cadre[section].count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return expand[indexPath.section] == 0 ? 0 : 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutUsCell", for: indexPath) as! AboutUsTableViewCell
        cell.photo.image = UIImage(named:cadre[indexPath.section][indexPath.row].photo)
        cell.position.text = cadre[indexPath.section][indexPath.row].position
        cell.name.text = cadre[indexPath.section][indexPath.row].name
        cell.introduce.text = cadre[indexPath.section][indexPath.row].introduce
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UITableViewHeaderFooterView()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        v.addGestureRecognizer(tapRecognizer)
        
        
        return v
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        
        let header = view as! UITableViewHeaderFooterView
        let imstr = expand[section] == 0 ? "劉祐炘" : "陳語涵"
        let headerImage = UIImage(named: imstr)
        let headerImageView = UIImageView(image: headerImage)
        headerImageView.frame = CGRect(x: self.tableView.frame.width-30, y: 0, width: 15, height: 15)
        header.addSubview(headerImageView)
        
    }
    
    @objc func handleTap(gestureRecognizer: UIGestureRecognizer)
    {
        
        let touch = gestureRecognizer.location(in: tableView)
        if let indexPath = tableView.indexPathForRow(at: touch) {
            expand[indexPath.section] = expand[indexPath.section] == 0 ? 1 : 0
            print(indexPath.section, indexPath.row)
            if expand[indexPath.section] == 1{
                self.tableView.reloadSections(IndexSet(arrayLiteral: indexPath.section), with: .automatic)
                self.tableView.reloadRows(at: [indexPath], with: .bottom)
                
                
            }else{
                self.tableView.reloadSections(IndexSet(arrayLiteral: indexPath.section), with: .automatic)
            }
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            
            
            // Access the image or the cell at this index path
        }
        
        
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
