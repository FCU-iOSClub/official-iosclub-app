//
//  ScrollViewController.swift
//  iOSClub
//
//  Created by iMac01 on 2019/7/5.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = scrollViewPhoto.count
        frame.size = scrollView.frame.size
        for index in 0..<scrollViewPhoto.count {
            frame.origin.x = scrollView.frame.width * CGFloat(index)
            
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: scrollViewPhoto[index])
            self.scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(scrollViewPhoto.count), height: scrollView.frame.size.height)
        //scrollView.delegate = self
        
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var scrollViewPhoto = ["劉祐炘","陳語涵"]

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
