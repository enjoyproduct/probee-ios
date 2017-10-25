//
//  FilterActivityViewController.swift
//  Beefitt
//
//  Created by Admin on 10/16/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import JCTagListView

class FilterActivityViewController: UIViewController {

    @IBOutlet weak var tagListView: JCTagListView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tagListView.canSelectTags = true
        self.tagListView.tagStrokeColor = UIColor.gray
        self.tagListView.tagBackgroundColor = UIColor.white
        self.tagListView.tagTextColor = UIColor.gray
        self.tagListView.tagSelectedBackgroundColor = UIColor.gray
        self.tagListView.tagSelectedTextColor = UIColor.white
        self.tagListView.tagCornerRadius = 5.0
        self.tagListView.tags.addObjects(from: ["All", "Sport", "Tuition", "Kids Service"])
    }
    @IBAction func onClickResetAll(_ sender: Any) {
        self.tagListView.selectedTags.removeAllObjects()
        
        self.tagListView.collectionView.reloadData()
    }
    @IBAction func onClickDone(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
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
