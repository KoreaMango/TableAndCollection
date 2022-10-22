//
//  TableViewController.swift
//  TableCollection
//
//  Created by 강민규 on 2022/10/12.
//

import UIKit
import Lottie
import SnapKit

private let cellID = "cellID"
class TableViewController: UITableViewController {
 
    var indexPath = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationItem.title = String(indexPath)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
        
        setRefreshView()
        
    }
    
    // MARK: - Refresh TableView
    func setRefreshView() {
        let lottieView : LottieAnimationView = {
            let view = LottieAnimationView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.animation = LottieAnimation.named("65622-ripple-alert")
            view.loopMode = .loop
            view.contentMode = .scaleAspectFit
            view.play()
            return view
        }()
        
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.translatesAutoresizingMaskIntoConstraints = false
        tableView.refreshControl?.subviews.first?.removeFromSuperview()
        
        tableView.refreshControl?.addTarget(self, action: #selector(refreshTable(refresh: )), for: .valueChanged)
        tableView.refreshControl?.addSubview(lottieView)
        
        lottieView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(tableView.snp.top)
            make.center.equalTo(view.safeAreaLayoutGuide.snp.center)
        }
        
    }
    
    @objc func refreshTable(refresh: UIRefreshControl) {
        print("REFRESH")
        self.tableView.reloadData()
        refresh.endRefreshing()
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID , for: indexPath) as! TableViewCell
        // Configure the cell...
        cell.lb.text = exampleData[indexPath.row]
        
        if indexPath.row % 10 == 0 {
            cell.isTen = true
        } else {
            cell.isTen = false
        }
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            print("delete")
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
