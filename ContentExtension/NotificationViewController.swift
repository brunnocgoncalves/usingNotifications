//
//  NotificationViewController.swift
//  ContentExtension
//
//  Created by Brunno Goncalves on 22/11/16.
//  Copyright © 2016 brunnogoncalves. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    @IBOutlet weak var contentImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        
        guard let attachment = notification.request.content.attachments.first else{
            
            return
            
        }
        
        if attachment.url.startAccessingSecurityScopedResource(){
            
            let imageData = try? Data.init(contentsOf: attachment.url)
            if let image = imageData{
                
                contentImage.image = UIImage(data: image)
                
            }
            
        }
        
        
    }

}
