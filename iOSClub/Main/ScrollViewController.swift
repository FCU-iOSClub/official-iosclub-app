//
//  ScrollViewController.swift
//  iOSClub
//
//  Created by iMac01 on 2019/7/5.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit
import ImageSlideshow

class ScrollViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var timer = Timer()
    
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
        
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.delegate = self
        
        pageControl.numberOfPages = scrollViewPhoto.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.orange
        pageControl.addTarget(
            self,
            action: #selector(ViewController.pressesChanged),
            for: .valueChanged)
        self.view.addSubview(pageControl)
        
        self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(changePage), userInfo: nil, repeats: true)
        
    }
    
    @objc func changePage(){
        
        if pageControl.currentPage < pageControl.numberOfPages - 1 {
            pageControl.currentPage += 1
            UIView.animate(withDuration: 0.5){
                self.scrollView.contentOffset = CGPoint(x: self.scrollView.frame.width * CGFloat(self.pageControl.currentPage), y: 0)
            }
        }else{
            pageControl.currentPage = 0
            UIView.animate(withDuration: 0.5){
                self.scrollView.contentOffset = CGPoint(x:0, y: 0)
            }
        }
        
        
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        //let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        //pageControl.currentPage = Int(pageNumber)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    override func viewDidDisappear(_ animated: Bool) {
        if self.timer != nil {
            self.timer.invalidate()
        }
    }
    */
    var scrollViewPhoto = ["劉祐炘","陳語涵","Apple","Apple","Apple"]
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
