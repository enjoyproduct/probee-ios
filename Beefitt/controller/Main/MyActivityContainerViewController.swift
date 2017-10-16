//
//  MyActivityContainerViewController.swift
//  Beefitt
//
//  Created by Admin on 10/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import CarbonKit

class MyActivityContainerViewController: UIViewController, CarbonTabSwipeNavigationDelegate {

    var titles = [String]()
    var carbonTabSwiftNavigation: CarbonTabSwipeNavigation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titles = ["Reservations", "Favorites"]
        
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
            carbonTabSwiftNavigation?.carbonSegmentedControl?.setWidth(getScreenSize().width / 2, forSegmentAt: i)
        }
        //customize segment color
        let font = UIFont.systemFont(ofSize: 13)
        carbonTabSwiftNavigation?.setNormalColor(Constant.lightGray.withAlphaComponent(0.6), font: font)
        carbonTabSwiftNavigation?.setSelectedColor(UIColor.white, font: font)
        ///add constraint
        let topConstraint = NSLayoutConstraint(item: carbonTabSwiftNavigation?.toolbar, attribute: .top, relatedBy: .equal, toItem: carbonTabSwiftNavigation?.view, attribute: .top, multiplier: 1, constant: 45)
        self.view.addConstraint(topConstraint)
    }
    
    // MARK: - CarbonTabSwipeNavigationDelegate
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyActivityViewController") as! MyActivityViewController
        vc.type = Int(index)
        return vc
        
    }
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, willMoveAt index: UInt) {
        
    }
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAt index: UInt) {
        
    }
    func barPosition(for carbonTabSwipeNavigation: CarbonTabSwipeNavigation) -> UIBarPosition {
        return UIBarPosition.top; // default UIBarPositionTop
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
