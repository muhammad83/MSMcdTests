//
//  ViewController.swift
//  BuddyBuildTest
//
//  Created by Davide De Franceschi on 16/05/2018.
//  Copyright © 2018 Equal Experts. All rights reserved.
//

import UIKit
import MCNumberLabel
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: MCNumberLabel!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            self.scoreLabel.setValue(432, duration: 2)
        }
    }

    @IBAction func didTapSetReminder(_ sender: Any) {
        guard let gifURL = Bundle.main.url(forResource: "bear", withExtension: "gif"), let attachment = try? UNNotificationAttachment(identifier: "gif", url: gifURL, options: nil)  else { return }
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = "showme"
        content.attachments = [attachment]
        content.title = "Hoorah!"
        content.body = "We've found new ways to save you money"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let notificationRequest = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(notificationRequest)
    }
}
