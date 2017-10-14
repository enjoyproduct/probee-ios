//
//  SelectCityViewController.swift
//  Beefitt
//
//  Created by Admin on 10/14/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SelectCityViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var arrCity = [CityModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.collectionView.register(UINib(nibName: "CityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CityCollectionViewCell")
        self.generateTestData()
    }
    func generateTestData() {
        let cityModel1 = CityModel()
        cityModel1.cityName = "Singapore"
        cityModel1.abbreviation = "SG"
        cityModel1.isSelected = false
        arrCity.append(cityModel1)
        let cityModel2 = CityModel()
        cityModel2.cityName = "Manila"
        cityModel2.abbreviation = "MNL"
        cityModel2.isSelected = false
        arrCity.append(cityModel2)
        let cityModel3 = CityModel()
        cityModel3.cityName = "Hong Kong"
        cityModel3.abbreviation = "HK"
        cityModel3.isSelected = false
        arrCity.append(cityModel3)
        let cityModel4 = CityModel()
        cityModel4.cityName = "Taipei"
        cityModel4.abbreviation = "TPE"
        cityModel4.isSelected = false
        arrCity.append(cityModel4)
        let cityModel5 = CityModel()
        cityModel5.cityName = "Kuala Lumpur"
        cityModel5.abbreviation = "KL"
        cityModel5.isSelected = false
        arrCity.append(cityModel5)
        let cityModel6 = CityModel()
        cityModel6.cityName = "Jakarta"
        cityModel6.abbreviation = "JKT"
        cityModel6.isSelected = false
        arrCity.append(cityModel6)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = Constant.colorPrimary
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        let backItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
        self.initTitleLabel(title: "Select your city")
    }
    
    func initTitleLabel(title: String) {
        let label = UILabel(frame: CGRect(x:0, y:0, width:getScreenSize().width - 120, height:50))
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 1
//        label.font = robotoMedium(size: 17)
        label.textAlignment = .center
        label.textColor = Constant.colorPrimary
        label.text = title
        self.navigationItem.titleView = label
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
extension SelectCityViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCity.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        let city = self.arrCity[indexPath.row]
        cell.lblCityName.text = city.cityName
        cell.lblAbbreviation.text = city.abbreviation
        if city.isSelected! {
            cell.ivSelected.isHidden = false
        } else {
            cell.ivSelected.isHidden = true
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3.2, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.resetSelection(index: indexPath.row)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func resetSelection(index: Int) {
        for city in self.arrCity {
            city.isSelected = false
        }
        self.arrCity[index].isSelected = true
        self.collectionView.reloadData()
    }
    
}
