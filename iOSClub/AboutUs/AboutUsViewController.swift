//
//  AboutUsViewController.swift
//  iOSClub
//
//  Created by ahkui on 2019/7/6.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import UIKit
import Alamofire
class AboutUsViewController: CollapsibleTableSectionViewController {
    
    @IBOutlet weak var topView: UIView!
    var cadres:[Cadres] = [
        Cadres("現任幹部(第三屆)", [
            Cadre("劉祐炘", "社長", "劉祐炘", "佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。", "fb://profile/100001324861329"),
            Cadre("劉祐炘", "社長", "劉祐炘", "佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。", "fb://profile/100001324861329"),
            Cadre("劉祐炘", "社長", "劉祐炘", "佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。", "fb://profile/100001324861329"),
            Cadre("劉祐炘", "社長", "劉祐炘", "佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。", "fb://profile/100001324861329"),
            Cadre("劉祐炘", "社長", "劉祐炘", "佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。", "fb://profile/100001324861329")]
        ),
        Cadres("第二屆", [
            Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。", "fb://profile/100002795974997"),
            Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。", "fb://profile/100002795974997"),
            Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。", "fb://profile/100002795974997"),
            Cadre("陳語涵","副社長","陳語涵","臭臉工程師，惜字千金，遇到不利自己的事情，就會開始亂叫。", "fb://profile/100002795974997")
            ]),
        Cadres("第ㄧ屆", [
            Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。", "fb://profile/100001324861329"),
            Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。", "fb://profile/100001324861329"),
            Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。", "fb://profile/100001324861329"),
            Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。", "fb://profile/100001324861329"),
            Cadre("劉祐炘","社長","劉祐炘","佛系工程師，Beatbox兼冷笑話大師，程式能力和冷笑話冷的程度成正比。", "fb://profile/100001324861329")
            ])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.delegate = self
        self.tableView.register(UINib(nibName: "AboutUsTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutUsTableViewCell")
        
        Alamofire.request("https://fcu-d0611134.jupyter.ahkui.com/api/v1/cadre").responseJSON{res in
            if let result = res.result.value{
                if let array = result as? [[String:AnyObject]]{
                    self.cadres = []
                    print("有幾屆\(array.count)")
                    for generation in array {
                        if let gen = generation["items"] as? [[String:String]] {
                            
                            var temp:[Cadre] = []
                            
                            for item in gen {
                                temp.append(Cadre(
                                    item["img"] ?? "default",
                                    item["position"] ?? "職位",
                                    item["name"] ?? "名字",
                                    item["introduce"] ?? "介紹",
                                    item["fbUrl"] ?? "fb://page/?id=414453055238471"
                                ))
                            }
                                
                                self.cadres.append(Cadres(
                                    generation["num"] as? String ?? "屆數",
                                    temp
                                ))
                            
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension AboutUsViewController: CollapsibleTableSectionDelegate {
    
    func numberOfSections(_ tableView: UITableView) -> Int {
        return cadres.count
    }
    
    func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cadres[section].items.count
    }
    
    func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AboutUsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AboutUsTableViewCell") as? AboutUsTableViewCell ?? AboutUsTableViewCell(style: .default, reuseIdentifier: "AboutUsTableViewCell")
        let index = indexPath.section
        let img = cadres[index].items[indexPath.row].photo
        if img!.count > 100{
            let data = Data(base64Encoded: cadres[index].items[indexPath.row].photo, options: .ignoreUnknownCharacters)
            cell.photo.image = UIImage(data: data!)
        }else{
            cell.photo.image = UIImage(named:cadres[index].items[indexPath.row].photo)
        }
        
        cell.position.text = cadres[index].items[indexPath.row].position
        cell.name.text = cadres[index].items[indexPath.row].name
        cell.introduce.text = cadres[index].items[indexPath.row].introduce
        return cell
    }
    func collapsibleTableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return cadres[section].title
    }
    
    func shouldCollapseOthers(_ tableView: UITableView) -> Bool {
        return false
    }
    
    func shouldCollapseByDefault(_ tableView: UITableView) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let urlString = cadres[indexPath.section].items[indexPath.row].getFbUrl()
        UIApplication.shared.open(URL(string: urlString)!)
    }
    
}








