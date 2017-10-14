//
//  RegisterViewController.swift
//  Beefitt
//
//  Created by Admin on 10/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var viewFullname: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewSignup: UIView!
    
    @IBOutlet weak var tfFullname: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Utils.drawFrame(to: self.viewSignup, corner: Constant.cornerRadius20, border: 1.0, color: UIColor.white)
        Utils.drawFrameToView(withFillColor: viewFullname, corner: Constant.cornerRadius20, border: 1.0, fill: UIColor.white)
        Utils.drawFrameToView(withFillColor: viewEmail, corner: Constant.cornerRadius20, border: 1.0, fill: UIColor.white)
        Utils.drawFrameToView(withFillColor: viewPassword, corner: Constant.cornerRadius20, border: 1.0, fill: UIColor.white)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        //make transparent navigation bar
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        //remove text of back button
        let backItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
        self.initTitleLabel(title: "Sign up with email")
    }
    
    func initTitleLabel(title: String) {
        let label = UILabel(frame: CGRect(x:0, y:0, width:getScreenSize().width - 120, height:50))
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 1
        //        label.font = robotoMedium(size: 17)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = title
        self.navigationItem.titleView = label
    }


    @IBAction func onClickAvatar(_ sender: Any) {
    }
    @IBAction func onClickSignup(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
        appDelegate.chageRootViewController(newRootViewController: vc)
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
