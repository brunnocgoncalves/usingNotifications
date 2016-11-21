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
                
                if let err = error?.localizedDescription{
                    print(err)
                }
            }
            
        })
    }
    
    @IBAction func getNotificationPressed(sender: UIButton){
        
        scheduleNotification(inSeconds: 5, completion: { success in
        
            if success{
                print("Done")
            } else{
                print("Error")
            }
        
        })
        
    }
    
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()){
        
        let notif = UNMutableNotificationContent()
        notif.title = "New notification"
        notif.subtitle = "Realy nice!!!"
        notif.body = "Using notification on iOS 10 is just amazing!!!"
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
        
            if error != nil{
                
                print(error!)
                completion(false)
                
            } else{
                
                completion(true)
                
            }
        
        })
        
    }

}

