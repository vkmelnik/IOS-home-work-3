//
//  SceneDelegate.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit
import CoreData

protocol RetroNotificationManager {
    func showNotification(title: String, text: String)
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UITabBarControllerDelegate, RetroNotificationManager {
    
    var window: UIWindow?
    var tabBarController: UITabBarController?
    var notificationView: NotificationView?
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AlarmModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    var context: NSManagedObjectContext?

    func generateAlarms(alarms: AlarmsContainer, context: NSManagedObjectContext) {
        for _ in 0..<10 {
            alarms.alarms.append( AlarmModel.createAlarm(context: context,
                time: Int.random(in: 0...1440),
                isActive: Bool.random()
                )
            )
        }
        alarms.alarms.sort(by: { $0.time < $1.time })
        alarms.setAlarms()
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let tabBarController = UITabBarController()
        let nav = UINavigationController()
        self.tabBarController = tabBarController
        
        let context = persistentContainer.viewContext
        self.context = context
        let alarms = AlarmsContainer()
        alarms.context = context
        alarms.loadContainer()
        
        let viewControllers = [
            StackViewAssembly().build(alarms: alarms, navigationController: nav),
            TableViewAssembly().build(alarms: alarms, navigationController: nav),
            CollectionViewAssembly().build(alarms: alarms, navigationController: nav),
            AlarmCreationViewAssembly().build(alarms: alarms, notificationManager: self, context: context)
        ]
        tabBarController.setViewControllers(viewControllers, animated: false)
        tabBarController.delegate = self
        nav.pushViewController(tabBarController, animated: false)
        //let nav = UINavigationController(rootViewController: tabBarController)
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
        guard let items =
                tabBarController.tabBar.items else {
            return
        }
        
        let titles = ["Stack", "Table", "Collection", "Add"]
        for i in 0..<viewControllers.count {
            viewControllers[i].title = titles[i]
            items[i].image = UIImage(named: titles[i])
        }
        
        setupRetroNavBar(nav: nav)
        setupRetroTabBar(tab: tabBarController)
        setupRetroNotification()
        tabBarController.title = "Stack"
    }
    
    func setupRetroNotification() {
        let not = NotificationView()
        window!.addSubview(not)
        not.frame = CGRect(x: 10, y: -120, width: window!.frame.width - 20, height: 90)
        not.title = "Alarm"
        not.text = "Alarm is created."
        not.isHidden = true
        self.notificationView = not
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
}

extension SceneDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.tabBarController?.title = viewController.title
    }
    
    func showNotification(title: String, text: String) {
        self.notificationView?.title = title
        self.notificationView?.text = text
        self.notificationView!.frame.origin.y = -120
        self.notificationView?.showAnimation()
    }
    
    func setupRetroNavBar(nav: UINavigationController) {
        let gradient = CAGradientLayer()
        let colors = [#colorLiteral(red: 0.456004262, green: 0.4560155272, blue: 0.4560095072, alpha: 1), #colorLiteral(red: 0.2275663614, green: 0.2227186561, blue: 0.2226118743, alpha: 1), #colorLiteral(red: 0.1129432991, green: 0.1129470244, blue: 0.1129450426, alpha: 1), #colorLiteral(red: 0.03797400743, green: 0.03797602281, blue: 0.03797493502, alpha: 1)]
        var bounds = nav.navigationBar.bounds
        let statusBarHeight = window!.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        bounds.size.height += statusBarHeight
        bounds.origin.y -= statusBarHeight
        gradient.frame = bounds
        gradient.colors = [colors[0].cgColor, colors[1].cgColor, colors[2].cgColor, colors[3].cgColor]
        gradient.locations = [0.0, 0.65, 0.7, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)

        nav.navigationBar.layer.addSublayer(gradient)
        // Sublayer[1] is a title.
        // Inserting sublayer doesn't work, title is above gradient in the debuger,
        // but below gradient in simulator.
        nav.navigationBar.layer.sublayers![1].zPosition = 2
        nav.navigationBar.tintColor = .white
        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func setupRetroTabBar(tab: UITabBarController) {
        let gradient = CAGradientLayer()
        let colors = [#colorLiteral(red: 0.8878544906, green: 0.8878544906, blue: 0.8878544906, alpha: 0.3804339311), #colorLiteral(red: 1, green: 0.98, blue: 0.98, alpha: 0.1312357986), #colorLiteral(red: 0.4968468549, green: 0.4968468549, blue: 0.4968468549, alpha: 0.06256542056), #colorLiteral(red: 0.03797400743, green: 0.03797602281, blue: 0.03797493502, alpha: 0)]
        let bounds = tab.tabBar.bounds
        let insets = window?.safeAreaInsets.bottom ?? 0
        let height = bounds.height
        gradient.frame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: height + insets)
        gradient.colors = [colors[0].cgColor, colors[1].cgColor, colors[2].cgColor, colors[3].cgColor]
        let offset1: Float = Float(0.45 * height / (insets + height))
        let offset2: Float = Float(0.55 * height / (insets + height))
        let locations: [NSNumber] = [NSNumber(value: 0.0), NSNumber(value: offset1), NSNumber(value: offset2), NSNumber(value: 1.0)]
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)

        let backLayer = CALayer()
        backLayer.frame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: height + insets)
        backLayer.backgroundColor = UIColor.black.cgColor
        tab.tabBar.layer.insertSublayer(backLayer, at: 0)
        tab.tabBar.layer.addSublayer(gradient)
        tab.tabBar.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        tab.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
}
