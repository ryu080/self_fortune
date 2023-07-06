//
//  MainViewController.swift
//  self_fortune
//
//  Created by 辻野竜志 on 2023/05/12.
//

import UIKit
import GoogleMobileAds
class MainViewController: UIViewController {

    var bannerView: GADBannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        self.setTabBarItem(index: 0, titile: "占う", image: UIImage(named: "uranai off")!, selectedImage: UIImage(named: "uranai x1")!, offColor: UIColor.blue, onColor: UIColor.init(red: 0.54, green: 0.32, blue: 1.00, alpha: 1.00))
            self.setTabBarItem(index: 1, titile: "作成", image: UIImage(named: "make off")!, selectedImage: UIImage(named: "make x1")!, offColor: UIColor.gray, onColor: UIColor.init(red: 0.54, green: 0.32, blue: 1.00, alpha: 1.00))
            
            UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 11)], for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 11)], for: .selected)
            
        }

        func setTabBarItem(index: Int, titile: String, image: UIImage, selectedImage: UIImage,  offColor: UIColor, onColor: UIColor) -> Void {
            let tabBarItem = self.tabBarController?.tabBar.items![index]
            tabBarItem!.title = titile
            tabBarItem!.image = image.withRenderingMode(.alwaysOriginal)
            tabBarItem!.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
            tabBarItem!.setTitleTextAttributes([ .foregroundColor : offColor], for: .normal)
            tabBarItem!.setTitleTextAttributes([ .foregroundColor : onColor], for: .selected)
        }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(
                item: bannerView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .bottom,
                multiplier: 1,
                constant: 0),
             NSLayoutConstraint(
                item: bannerView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0)])
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func main(segue:UIStoryboardSegue){
        
    }
}
