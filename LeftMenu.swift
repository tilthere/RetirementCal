//
//  LeftMenu.swift
//  ReCal
//
//  Created by Xiaomei Huang on 9/19/16.
//  Copyright © 2016 Xiaomei Huang. All rights reserved.
//

import UIKit

enum Menu: Int {
    case MainPage
    case BasicInfo
    case Goal
    case Report
    case SaveReports
}

protocol LeftMenuProtocol : class {
    func changeViewController(menu: Menu)
}





class LeftMenu: UIViewController,LeftMenuProtocol {
    
    
    
    @IBAction func toInfo(sender: AnyObject) {
        let menu = Menu.BasicInfo
        self.changeViewController(menu)
    }
    
    
    
    @IBAction func toGoal(sender: AnyObject) {
        let menu = Menu.Goal
        self.changeViewController(menu)
    }
    
    @IBAction func toReport(sender: AnyObject) {
        let menu = Menu.Report
        self.changeViewController(menu)
    }
    
    
    @IBAction func resetToMain(sender: AnyObject) {
        let userinfo = NSUserDefaults.standardUserDefaults()

        userinfo.setObject("", forKey: "username")
        userinfo.setObject(NSCalendar.currentCalendar().dateByAddingUnit(.Year, value: -18, toDate: NSDate(), options: []), forKey: "birthday")
        userinfo.setObject("Male", forKey: "gender")
        userinfo.setObject(18, forKey: "age")
        userinfo.setObject(0, forKey: "annualIncome")
        userinfo.setObject(0, forKey: "pension")
        userinfo.setObject(0, forKey: "parttime")
        userinfo.setObject(0, forKey: "other")
        userinfo.setObject(70, forKey: "percentage")
        userinfo.setObject(85, forKey: "expYear")
        userinfo.setObject(65, forKey: "expAge")
        userinfo.setObject(0, forKey: "currentSaving")
        userinfo.setObject(0, forKey: "amount")
        userinfo.setObject(0, forKey: "expAnnualIncome")
        userinfo.setObject(0, forKey: "expMonthlyIncome")
        

        
        let menu = Menu.MainPage
        self.changeViewController(menu)
    }
    
    
    @IBAction func savedReportsB(sender: AnyObject) {
        let menu = Menu.SaveReports
        self.changeViewController(menu)
    }
    
    
    var menus = ["MainPage", "BasicInfo", "Goal", "Report"]
    var mainPageVC: UIViewController!
    var basicInfoVC: UIViewController!
    var goalVC: UIViewController!
    var reportVC: UIViewController!
    var savedVC: UIViewController!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainPageVC = storyboard.instantiateViewControllerWithIdentifier("mainPage") as! MainPage
        self.mainPageVC = UINavigationController(rootViewController: mainPageVC)
        
        let basicInfoVC = storyboard.instantiateViewControllerWithIdentifier("basicInfo") as!BasicInfo
        
        self.basicInfoVC = UINavigationController(rootViewController: basicInfoVC)
        
        let goalVC = storyboard.instantiateViewControllerWithIdentifier("goal") as! Goal
        
        self.goalVC = UINavigationController(rootViewController: goalVC)
        
    
        let reportVC = storyboard.instantiateViewControllerWithIdentifier("report") as! ReportVC
        
        self.reportVC = UINavigationController(rootViewController: reportVC)
        
        let savedVC = storyboard.instantiateViewControllerWithIdentifier("savedReports") as! SavedReports
        
        self.savedVC = UINavigationController(rootViewController: savedVC)
        

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    

    func changeViewController(menu: Menu) {
        switch menu {
        case .MainPage:
            self.slideMenuController()?.changeMainViewController(self.mainPageVC, close: true)
        case .BasicInfo:
            self.slideMenuController()?.changeMainViewController(self.basicInfoVC, close: true)
        case .Goal:
            self.slideMenuController()?.changeMainViewController(self.goalVC, close: true)
        case .Report:
            self.slideMenuController()?.changeMainViewController(self.reportVC, close: true)
        case .SaveReports:
            self.slideMenuController()?.changeMainViewController(self.savedVC, close: true)

        }
    }

}
