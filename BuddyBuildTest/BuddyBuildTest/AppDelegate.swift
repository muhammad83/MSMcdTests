//
//  AppDelegate.swift
//  BuddyBuildTest
//
//  Created by Davide De Franceschi on 16/05/2018.
//  Copyright © 2018 Equal Experts. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (granted, error) in
            if granted {
                self.setNotificationCategories()
            }
        }
        return true
	}

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
    }

    private func setNotificationCategories() {
        let noThanksAction = UNNotificationAction(identifier: "nothanks", title: "No thanks", options: [])
        let maybeLaterAction = UNNotificationAction(identifier: "maybelater", title: "Maybe later", options: [])
        let showMeAction = UNNotificationAction(identifier: "showme", title: "Show me!", options: [.foreground])

        let showMeCategory = UNNotificationCategory(identifier: "showme", actions: [noThanksAction, maybeLaterAction, showMeAction], intentIdentifiers: [], options: [])

        UNUserNotificationCenter.current().setNotificationCategories([showMeCategory])
    }
}

