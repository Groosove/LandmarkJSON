//
//  AppDelegate.swift
//  LandmarkJSON
//
//  Created by Артур Лутфуллин on 24.06.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var sharedCache = URLCache.shared

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		let rootVC = LandmarkBuilder()
		window?.rootViewController = rootVC.build()
		window?.makeKeyAndVisible()
        let urlCache = URLCache(memoryCapacity: 6 * 1024 * 1024, diskCapacity: 0, diskPath: nil)
        sharedCache = urlCache
		return true
	}

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {
        sharedCache.removeAllCachedResponses()
        sharedCache.diskCapacity = 0
        sharedCache.memoryCapacity = 0
    }

}

