//
//  ImageSlideshowViewController.swift
//  iOSClub
//
//  Created by iMac01 on 2019/7/6.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit
import ImageSlideshow

class ImageSlideshowViewController: UIViewController {
    @IBOutlet weak var slideView: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slideView.slideshowInterval = 3
        slideView.setImageInputs([
            ImageSource(image: UIImage(named: "劉祐炘")!),
            ImageSource(image: UIImage(named: "陳語涵")!),
            ImageSource(image: UIImage(named: "劉祐炘")!),
            ImageSource(image: UIImage(named: "劉祐炘")!),
            ImageSource(image: UIImage(named: "劉祐炘")!),
            ImageSource(image: UIImage(named: "劉祐炘")!)
            ])
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ImageSlideshowViewController.didTap))
        slideView.addGestureRecognizer(gestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    @objc func didTap() {
        slideView.presentFullScreenController(from: self)
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
