//
//  ScheduleViewController.swift
//  Beefitt
//
//  Created by Admin on 10/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblFilterStatus: UILabel!
    @IBOutlet weak var lblSortName: UILabel!
    @IBOutlet weak var lblShowResultCount: UILabel!
    
    @IBOutlet weak var lblDate1: UILabel!
    @IBOutlet weak var lblDay1: UILabel!
    @IBOutlet weak var lblDate2: UILabel!
    @IBOutlet weak var lblDay2: UILabel!
    @IBOutlet weak var lblDate3: UILabel!
    @IBOutlet weak var lblDay3: UILabel!
    @IBOutlet weak var lblDate4: UILabel!
    @IBOutlet weak var lblDay4: UILabel!
    @IBOutlet weak var lblDate5: UILabel!
    @IBOutlet weak var lblDay5: UILabel!
    @IBOutlet weak var lblDate6: UILabel!
    @IBOutlet weak var lblDay6: UILabel!
    @IBOutlet weak var lblDate7: UILabel!
    @IBOutlet weak var lblDay7: UILabel!
    
    
    var arrActivity = [ActivityModel]()
    
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
    
    @IBAction func onClickFilter(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterContainerViewController") as! FilterContainerViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func onClickSort(_ sender: UIButton) {
    }
    @IBAction func onClickedDay1(_ sender: Any) {
    }
    @IBAction func onClickedDay2(_ sender: Any) {
    }
    @IBAction func onClickedDay3(_ sender: Any) {
    }
    @IBAction func onClickedDay4(_ sender: Any) {
    }
    @IBAction func onClickedDay5(_ sender: Any) {
    }
    @IBAction func onClickedDay6(_ sender: Any) {
    }
    @IBAction func onClickedDay7(_ sender: Any) {
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
extension ScheduleViewController : UITableViewDelegate {
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

extension ScheduleViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return self.arrActivity.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTableViewCell") as! ActivityTableViewCell
        //        let activity = self.arrActivity[indexPath.row]
        
        return cell
    }
    
    
}
