//
//  ViewController.swift
//  iOSClub
//
//  Created by iMac04 on 2019/7/3.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit

class ViewController: CollapsibleTableSectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.delegate = self
        self._tableView.register(UINib(nibName: "AboutUsTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutUsTableViewCell")
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var cadre:[[Cadre]] = [
        [Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。")],
        [Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。")]
    ]
    
}

extension ViewController: CollapsibleTableSectionDelegate {
    
    func numberOfSections(_ tableView: UITableView) -> Int {
        return cadre.count
    }
    
    func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cadre[section].count
    }
    
    func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AboutUsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AboutUsTableViewCell") as? AboutUsTableViewCell ?? AboutUsTableViewCell(style: .default, reuseIdentifier: "AboutUsTableViewCell")
        
        cell.photo.image = UIImage(named:cadre[indexPath.section][indexPath.row].photo)
        cell.position.text = cadre[indexPath.section][indexPath.row].position
        cell.name.text = cadre[indexPath.section][indexPath.row].name
        cell.introduce.text = cadre[indexPath.section][indexPath.row].introduce
        
        return cell
    }
    
}
