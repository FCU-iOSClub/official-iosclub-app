//
//  AboutUsViewController.swift
//  iOSClub
//
//  Created by ahkui on 2019/7/6.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import UIKit
import Alamofire


extension UIImageView {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    public func imageFromUrl(_ urlString: String,completion: @escaping () -> ()) {
        
        let url:URL! = URL(string: urlString)
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            let imageCache = delegate.imageCache
            
            if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
                self.image = imageFromCache
                completion()
                return
            }
            
            getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async() {
                    let imageToCache = UIImage(data: data)
                    imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                    if self.image == nil {
                        self.image = imageToCache
                    }
                    completion()
                }
            }
        }
    }
}

class AboutUsViewController: CollapsibleTableSectionViewController {
    
    var cadres :[Cadres] = []
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.delegate = self
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        self.tableView.register(UINib(nibName: "AboutUsTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutUsTableViewCell")
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
    }
    
    @objc func loadData(){
        Alamofire.request("https://fcuiosclub.jupyter.ahkui.com/api/v1/cadre")
            .responseJSON{res in
                if let result = res.result.value{
                    if let array = result as? [[String:AnyObject]]{
                        self.cadres = []
                        for generation in array {
                            if let gen = generation["items"] as? [[String:String]] {
                                var temp:[Cadre] = []
                                for item in gen {
                                    temp.append(Cadre(
                                        item["img"] ?? "default",
                                        item["position"] ?? "職位",
                                        item["name"] ?? "名字",
                                        item["introduce"] ?? "介紹",
                                        item["fbUrl"] ?? "https://www.facebook.com/FCU.iOSClub/"
                                    ))
                                }
                                self.cadres.append(Cadres(
                                    generation["num"] as? String ?? "屆數",
                                    temp
                                ))
                            }
                        }
                        self.tableView.reloadData()
                    }
                }
                self.refreshControl.endRefreshing()
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
        
        if let img = cadres[index].items[indexPath.row].photo {
            cell.photo.image = nil
            cell.loading.startAnimating()
            cell.photo.imageFromUrl("https://drive.google.com/uc?id=\(img)&export=download") {
                cell.loading.stopAnimating()
            }
        } else {
            cell.photo.image = UIImage(named: "default")
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
        if  UIApplication.shared.canOpenURL(URL(string:"fb://profile/\(urlString)")!){
            UIApplication.shared.open(URL(string: "fb://profile/\(urlString)")!)
        }else{
            UIApplication.shared.open(URL(string: "https://www.facebook.com/\(urlString)")!)
        }
    }
    
}















