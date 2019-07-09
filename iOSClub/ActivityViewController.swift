//
//  ActivityViewController.swift
//  iOSClub
//
//  Created by iMac02 on 2019/7/4.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit


class ActivityViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    let data:[ Int: [(TimelinePoint, UIColor, String, String, String, String?, String?, String?)]] = [0:[
        (TimelinePoint(), UIColor.black, "2019/09/15","社團博覽會", "歡迎新生來社團攤位", nil, nil, "maple"),
        (TimelinePoint(), UIColor.black, "2019/10/15","新生茶會", "歡迎新生來社團攤", nil, nil, nil),
        (TimelinePoint(color: UIColor.black, filled: true), UIColor.black, "2019/11/15","雙十烤肉", "歡迎新生來社團", "參考用", "Apple", nil),
        (TimelinePoint(), UIColor.clear, "2019/12/15","聖誕節交換禮物及期末聚", "歡迎新生來社團", nil, nil, nil)
        ], 1:[
            (TimelinePoint(), UIColor.lightGray, "2019/08/15","期末聚", "歡迎新生來社團", "60 mins", nil, nil),
            (TimelinePoint(), UIColor.lightGray, "2019/07/15","歡迎新生來社團", "30 mins",nil, nil, nil),
            (TimelinePoint(), UIColor.lightGray, "2019/06/15","社員大會", "歡迎新生來社團",nil, nil, "Sun"),
            (TimelinePoint(), UIColor.lightGray, "2019/05/15","幹部宣布", "歡迎新生來社團", "60 mins", nil, "Sun"),
            (TimelinePoint(), UIColor.lightGray, "2019/04/15","期末聚", "歡迎新生來社團", "30 mins", "Apple", "Sun"),
            (TimelinePoint(), UIColor.lightGray, "2019/03/15","期中聚", "歡迎新生來社團", "120 mins", "Apple", "spring flower"),
            (TimelinePoint(), UIColor.lightGray, "2019/02/15","workshop", "歡迎新生來社團", "150 mins", "Apple", "Sun"),
            (TimelinePoint(), UIColor.lightGray, "2019/01/15","烤肉", "歡迎新生來社團", "60 mins", nil, "Sun"),
            (TimelinePoint(), UIColor.lightGray, "2018/12/15","聖誕交換禮物", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", nil, nil, "Moon"),
            (TimelinePoint(), UIColor.lightGray, "2018/11/15","烤肉", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "30 mins", nil, "Moon"),
            (TimelinePoint(), backColor: UIColor.clear, "2018/10/15","萬聖節", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", nil, nil, "Moon")
        ]]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionData = data[section] else {
            return 0
        }
        return sectionData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section==0)
        {
            return "未來活動"
        }
        else
        {
            return "過往活動"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        // Configure the cell...
        guard let sectionData = data[indexPath.section] else {
            return cell
        }
        
        let (timelinePoint, timelineBackColor, title,date, description, lineInfo, thumbnail, illustration) = sectionData[indexPath.row]
        var timelineFrontColor = UIColor.clear
        if (indexPath.row > 0) {
            timelineFrontColor = sectionData[indexPath.row - 1].1
        }
        cell.timelinePoint = timelinePoint
        cell.timeline.frontColor = timelineFrontColor
        cell.timeline.backColor = timelineBackColor
        cell.titleLabel.text = title
        cell.dateLabel.text = date
        cell.descriptionLabel.text = description
        cell.lineInfoLabel.text = lineInfo
        if let thumbnail = thumbnail {
            cell.thumbnailImageView.image = UIImage(named: thumbnail)
        }
        else {
            cell.thumbnailImageView.image = nil
        }
        if let illustration = illustration {
            cell.illustrationImageView.image = UIImage(named: illustration)
        }
        else {
            cell.illustrationImageView.image = nil
        }
        
        return cell
        
    }
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        let timelineTableViewCellNib=UINib(nibName: "TimelineTableViewCell", bundle: Bundle(for:TimelineTableViewCell.self))
        tableview.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
