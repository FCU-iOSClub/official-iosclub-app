//
//  curriculumStoryboardCollectionViewController.swift
//  iOSClub
//
//  Created by 阿騰 on 2019/7/4.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import UIKit
import Alamofire
private let reuseIdentifier = "Cell"

class Course{
    var name:String!
    var url:String!
    var date:String!
    init(_ date:String, _ name:String, _ url:String) {
        self.date = date
        self.name = name
        self.url = url
    }
}



class curriculumStoryboardCollectionViewController: UICollectionViewController {
    var curriculum:[Course] = []
    var currarr:[String] = ["第一堂社課","第二堂社課","第三堂社課","第五堂社課","第六堂社課","第七堂社課"]
    var datearr:[String] = ["2019.05.31","2019.06.04","2019.06.10","2019.06.19","2019.06.22","2019.06.30"]
    var linkarr:[String] = [
        "https://drive.google.com/file/d/1M8yP804MCF_wmtaVeOCTk-0_FEPs0ghe/view",
        "https://drive.google.com/file/d/19M0So61yIaGOj7r0iY3p2OPVvRmf5T_u/view",
        "https://drive.google.com/file/d/1Qa3FVzDGB8ccZBLju9EZBj1Mw1e6KDrl/view",
        "https://drive.google.com/file/d/1s5gVC_UYKM4x12PkHl7lMATRJJ0ybI45/view",
        "https://drive.google.com/file/d/1D53ktmb-Z7pCTnV3IHEssCGSQ2AGRIfd/view",
        "https://drive.google.com/file/d/1D5AQ-v1-mbmPQfVR-q8KeIqxHjPBlXJ6/view",
        
        ]
    let viewSize = UIScreen.main.nativeBounds.width
    var refreshControl:UIRefreshControl!
    
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout.sectionInset.left = viewSize/25
        layout.sectionInset.right = viewSize/25
        
        self.loadDataFromServer()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadDataFromServer), for: .valueChanged)
        self.collectionView.addSubview(refreshControl)
      
    }
    @objc func loadDataFromServer(){
        
        Alamofire.request("http://127.0.0.1:2914/api/v1/curriculum").responseJSON(completionHandler:
            {(res) in
                if let result = res.result.value{
                    if let curriuculum = result as? [[String:String]]{
                        self.curriculum = []
                        for i in curriuculum{
                            self.curriculum.append(Course(i["date"]!, i["name"]!, i["url"]!))
                        }
                        self.refreshControl.endRefreshing()
                        self.collectionView.reloadData()
                    }
                }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return curriculum.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CurriculumCollectionViewCell
        //cell.image.image = UIImage(named: "課程背景") //圖像不更動

        cell.date.text = curriculum[indexPath.row].date //日期
        cell.curr.text = curriculum[indexPath.row].name //課程
        cell.text.text = curriculum[indexPath.row].url //網址
        
        
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        cell.alpha = 0.2
        
        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
            cell.alpha = 1
        }
    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
