//
//  ViewController.swift
//  Notification
//
//  Created by nguyen.nam.khanh on 3/21/19.
//  Copyright © 2019 nguyen.nam.khanh. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (granted, error) in
            if granted {
                print("done")
            } else {
                print("hell no")
            }
        }
    }

    
    @IBAction func sendAction(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.subtitle = "team Khanh"
        content.body = "content"
        
        guard let url = Bundle.main.url(forResource: "image_jess", withExtension: "jpg") else {
            return
        }
        
        let attach = try! UNNotificationAttachment(identifier: "attach", url: url   , options: .none)
        content.attachments = [attach]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "101", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
    }
    
    
}

