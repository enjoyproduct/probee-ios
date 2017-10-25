//
//  FilterLocationViewController.swift
//  Beefitt
//
//  Created by Admin on 10/16/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit


class FilterLocationViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var locationGroup: TNRadioButtonGroup? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createVerticalRadioGroup()
    }
    func createVerticalRadioGroup() {
        let all = TNCircularRadioButtonData()
        all.labelText = "All"
        all.identifier = "all"
        all.selected = false
        
        let data5km = TNCircularRadioButtonData()
        data5km.labelText = "Within 5km"
        data5km.identifier = "5km"
        data5km.selected = false
        
        let data3km = TNCircularRadioButtonData()
        data3km.labelText = "Within 3km"
        data3km.identifier = "3km"
        data3km.selected = false
        
        let data1km = TNCircularRadioButtonData()
        data1km.labelText = "Within 1km"
        data1km.identifier = "1km"
        data1km.selected = false
        
        self.locationGroup = TNRadioButtonGroup(radioButtonData: [all, data5km, data3km, data1km], layout: TNRadioButtonGroupLayoutVertical)
        self.locationGroup?.identifier = "locationGroup"
        self.locationGroup?.textPassiveColor = UIColor.darkGray
        self.locationGroup?.textActiveColor = Constant.colorPrimary
        self.locationGroup?.controlPassiveColor = UIColor.darkGray
        self.locationGroup?.controlActiveColor = Constant.colorPrimary
        
        self.locationGroup?.create()
        self.locationGroup?.position = CGPoint(x: 20, y: 20)
        
        self.containerView.addSubview(self.locationGroup!)
        NotificationCenter.default.addObserver(self, selector: Selector(("locationGroupUpdated")), name: NSNotification.Name(rawValue: "SelectedLocationGroupUpdated"), object: self.locationGroup)
    }

    func locationGroupUpdated(notification: NSNotification) {
        print(self.locationGroup?.selectedRadioButton.data.identifier ?? "")
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
