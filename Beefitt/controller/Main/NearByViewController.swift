//
//  NearByViewController.swift
//  Beefitt
//
//  Created by Admin on 10/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class NearByViewController: UIViewController {

    var type = 0;
    var arrActivity = [ActivityModel]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.register(UINib(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivityTableViewCell")
        self.tableView.addInfiniteScrolling{
            self.insertAtBottom()
        }
        
    }
    func insertAtBottom() {
        self.tableView.infiniteScrollingView.stopAnimating()
        
        
    }
    func insertAtTop()  {
        self.tableView.pullToRefreshView.stopAnimating()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension NearByViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailActivityViewController") as! DetailActivityViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension NearByViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.arrActivity.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTableViewCell") as! ActivityTableViewCell
//        let activity = self.arrActivity[indexPath.row]
        cell.ivReservedWidthConstraint.constant = 0
        return cell
    }
    
    
}


