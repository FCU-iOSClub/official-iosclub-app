//
//  TheMainTableViewController.swift
//  iOSClub
//
//  Created by iMac01 on 2019/7/6.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit

class TheMainTableViewController: UITableViewController{
    
    let iOSMail = "iosclub@mail.fcu.edu.tw"
    @IBAction func mailButton(_ sender: Any) {
        guard let url = URL(string: "mailto:\(iOSMail)")else {
            print("URLError")
            return
        }
        print(UIApplication.shared.canOpenURL(url))
        UIApplication.shared.open(url)
        //mailto:iosclub@mail.fcu.edu.tw
    }
    @IBAction func fbButton(_ sender: Any) {
        guard let url = URL(string: "fb://page/?id=298555283953840") else {
            print("URLError")
            return
        }
        if UIApplication.shared.canOpenURL(url){
            print("here")
            UIApplication.shared.open(url)
        }else{
            print("failed")
            UIApplication.shared.open(URL(string: "https://www.facebook.com/FCU.iOSClub/")!)
        }
        
    }
    @IBAction func igButton(_ sender: Any) {
        guard let url = URL(string: "https://www.instagram.com/fcu.iosclub/") else {
            print("URLError")
            return
        }
        UIApplication.shared.open(url)
    }
    
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
