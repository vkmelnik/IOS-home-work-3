//
//  NotificationManager.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 20.10.2021.
//

import UIKit

// Class that manages all notifications in the app.
class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    static let sounds: [String] = ["iphone_alarm1.mp3", "iphone_alarm2.mp3", "iphone_alarm3.mp3"]
    
    // Notification center.
    let notificationCenter = UNUserNotificationCenter.current()
    
    // Ask user to allow notifications.
    func requestPermission() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
        notificationCenter.delegate = self
    }
    
    // Add notification to notification center.
    func scheduleNotification(alarm: AlarmModel) {
        
        let content = UNMutableNotificationContent() // Содержимое уведомления
        
        content.title = "Alarm"
        content.body = "\(alarm.title)"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: NotificationManager.sounds[alarm.soundNumber]))
        content.badge = 1
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        let date = dateFormatter.date(from: alarm.getFormatedTime())
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute], from: date!)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        
        let identifier = "Alarm number \(alarm.id)"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
    // Remove notification from notification center.
    func unscheduleNotification(identifier: Int) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: ["Alarm number \(identifier)"])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}
