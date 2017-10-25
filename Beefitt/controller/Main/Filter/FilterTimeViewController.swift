//
//  FilterTimeViewController.swift
//  Beefitt
//
//  Created by Admin on 10/16/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit


class FilterTimeViewController: UIViewController {

    @IBOutlet weak var containverView: UIView!
    var timeGroup: TNRadioButtonGroup? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.createVerticalRadioGroup()
    }
    
    func createVerticalRadioGroup() {
        
        let earlyMorning = TNCircularRadioButtonData()
        earlyMorning.labelText = "Early Morning (6AM - 9AM)"
        earlyMorning.identifier = "earlyMorning"
        earlyMorning.selected = false
        
        let morning = TNCircularRadioButtonData()
        morning.labelText = "Morning (9AM-12PM)"
        morning.identifier = "morning"
        morning.selected = false
        
        let noon = TNCircularRadioButtonData()
        noon.labelText = "Noon(12PM-2PM)"
        noon.identifier = "noon"
        noon.selected = false
        
        let afternoon = TNCircularRadioButtonData()
        afternoon.labelText = "Afternoon(2PM-6PM)"
        afternoon.identifier = "afternoon"
        afternoon.selected = false
        
        let evening = TNCircularRadioButtonData()
        evening.labelText = "Evening(6PM-9PM)"
        evening.identifier = "evening"
        evening.selected = false
        
        let night = TNCircularRadioButtonData()
        night.labelText = "Night(9PM-12AM)"
        night.identifier = "night"
        night.selected = false
        
        self.timeGroup = TNRadioButtonGroup(radioButtonData: [earlyMorning, morning, noon, afternoon, evening, night], layout: TNRadioButtonGroupLayoutVertical)
        self.timeGroup?.identifier = "timeGroup"
        self.timeGroup?.textPassiveColor = UIColor.darkGray
        self.timeGroup?.textActiveColor = Constant.colorPrimary
        self.timeGroup?.controlPassiveColor = UIColor.darkGray
        self.timeGroup?.controlActiveColor = Constant.colorPrimary
        self.timeGroup?.multipleOptions = true
        
        self.timeGroup?.create()
        self.timeGroup?.position = CGPoint(x: 20, y: 20)
        
        self.containverView.addSubview(self.timeGroup!)
        NotificationCenter.default.addObserver(self, selector: Selector(("timeGroupUpdated")), name: NSNotification.Name(rawValue: "SelectedtimeGroupUpdated"), object: self.timeGroup)
    }
    
    func timeGroupUpdated(notification: NSNotification) {
        print(self.timeGroup?.selectedRadioButton.data.identifier ?? "")
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
