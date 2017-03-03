//
//  SubContentsViewController.swift
//  ReCal
//
//  Created by Xiaomei Huang on 9/27/16.
//  Copyright © 2016 Xiaomei Huang. All rights reserved.
//

import UIKit
import Social

class SubContentsViewController: UIViewController {
    
    var userInfo = NSUserDefaults.standardUserDefaults()
    
    var showImg = UIImage()
    
    @IBOutlet weak var fullImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullImg.image = showImg
        
//        let safari : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: #selector(SubContentsViewController.share))
//        
//        self.navigationItem.rightBarButtonItems = [safari]
        
  //      self.navigationController?.toolbarHidden = false
  //      var items = [UIBarButtonItem]()
        let flexibleB = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)


        
        //Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.center = CGPointMake(view.frame.width/2, view.frame.height-20)
        toolbar.backgroundColor = UIColor.clearColor()
        toolbar.tintColor = UIColor(red:0.06, green:0.34, blue:0.11, alpha:1.0)
        
        //Alight Left and Right
        let share = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: #selector(SubContentsViewController.share))
        let trash = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self, action: nil)
        toolbar.items = [share, flexibleB, trash]
        
        view.addSubview(toolbar)
        
    }
    
    func share()
    {

        let img = self.showImg
        
        let activityViewController = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }



}
