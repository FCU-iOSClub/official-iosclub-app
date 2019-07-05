//
//  curriculumStoryboardCollectionViewController.swift
//  iOSClub
//
//  Created by 阿騰 on 2019/7/4.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
var imagarr:[String] = ["第一節","第二節","第三節","第五節","第六節","第七節"]
var linkarr:[String] = [
    "https://drive.google.com/file/d/1M8yP804MCF_wmtaVeOCTk-0_FEPs0ghe/view",
    "https://drive.google.com/file/d/19M0So61yIaGOj7r0iY3p2OPVvRmf5T_u/view",
    "https://drive.google.com/file/d/1Qa3FVzDGB8ccZBLju9EZBj1Mw1e6KDrl/view",
    "https://drive.google.com/file/d/1s5gVC_UYKM4x12PkHl7lMATRJJ0ybI45/view",
    "https://drive.google.com/file/d/1D53ktmb-Z7pCTnV3IHEssCGSQ2AGRIfd/view",
    "https://drive.google.com/file/d/1D5AQ-v1-mbmPQfVR-q8KeIqxHjPBlXJ6/view",

    ]
let viewSize = UIScreen.main.nativeBounds.width
class curriculumStoryboardCollectionViewController: UICollectionViewController {
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewSize)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    //    layout.minimumInteritemSpacing = 0
        // Register cell classes

        // Do any additional setup after loading the view.
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
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CurriculumCollectionViewCell
        cell.image.image = UIImage(named: imagarr[indexPath.row])
       // cell.backgroundColor = .black
        // Configure the cell
       // cell.frame.size.width = viewSize / 7
        cell.image.layer.borderColor = UIColor.black.cgColor
        cell.image.layer.borderWidth = 3
        cell.text.text = linkarr[indexPath.row]
        
        return cell
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
