//
//  ViewController.swift
//  UsingNotifications
//
//  Created by Brunno Goncalves on 21/11/16.
//  Copyright © 2016 brunnogoncalves. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { (granted, error) in
         
            if granted {
                
                print("OK")
                
            } else{
                
                print(error?.localizedDescription)
                
            }
            
        })
    }

}

