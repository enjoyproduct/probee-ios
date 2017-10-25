//
//  FilterContainerViewController.swift
//  Beefitt
//
//  Created by Admin on 10/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import CarbonKit

class FilterContainerViewController: UIViewController, CarbonTabSwipeNavigationDelegate  {

    var titles = [String]()
    var carbonTabSwiftNavigation: CarbonTabSwipeNavigation? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titles = ["Activity", "Location", "Time", ""]
        
        carbonTabSwiftNavigation = CarbonTabSwipeNavigation(items: titles, delegate: self)
        carbonTabSwiftNavigation?.insert(intoRootViewController: self)
        
        self.style()
        
    }
    func style()  {
        //make transparent toolbar
        carbonTabSwiftNavigation?.toolbar.isTranslucent = true
        carbonTabSwiftNavigation?.toolbar.setBackgroundImage(UIImage(), forToolbarPosition: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        carbonTabSwiftNavigation?.toolbar.setShadowImage(UIImage(), forToolbarPosition: .any)
        carbonTabSwiftNavigation?.toolbar.backgroundColor = UIColor.clear
        carbonTabSwiftNavigation?.toolbar.barTintColor = UIColor.clear
        //set text color
        carbonTabSwiftNavigation?.toolbar.tintColor = UIColor.white
        //set indicator color
        carbonTabSwiftNavigation?.setIndicatorColor(UIColor.white)
        //set tab width
        for i in 0..<self.titles.count  {
            carbonTabSwiftNavigation?.carbonSegmentedControl?.setWidth(getScreenSize().width / 4, forSegmentAt: i)
        }
        //customize segment color
        let font = UIFont.systemFont(ofSize: 13)
        carbonTabSwiftNavigation?.setNormalColor(Constant.lightGray.withAlphaComponent(0.6), font: font)
        carbonTabSwiftNavigation?.setSelectedColor(UIColor.white, font: font)
        ///add constraint
        let topConstraint = NSLayoutConstraint(item: carbonTabSwiftNavigation?.toolbar, attribute: .top, relatedBy: .equal, toItem: carbonTabSwiftNavigation?.view, attribute: .top, multiplier: 1, constant: 6)
        self.view.addConstraint(topConstraint)
    }
    
    // MARK: - CarbonTabSwipeNavigationDelegate
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        switch index {
        case 0:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterActivityViewController") as! FilterActivityViewController
            return vc
        case 1:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterLocationViewController") as! FilterLocationViewController
            return vc
        case 2:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterTimeViewController") as! FilterTimeViewController
            return vc
        case 3:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterOtherViewController") as! FilterOtherViewController
            return vc
        default:
            
            return UIViewController()
        }
        
    }
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, willMoveAt index: UInt) {
        
    }
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAt index: UInt) {
        if index == 3 {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func barPosition(for carbonTabSwipeNavigation: CarbonTabSwipeNavigation) -> UIBarPosition {
        return UIBarPosition.top; // default UIBarPositionTop
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true)
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
