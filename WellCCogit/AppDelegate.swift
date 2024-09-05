//
//  AppDelegate.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import UIKit
import KeychainSwift
import SnapKit
import RxSwift
import RxCocoa
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let userDefaultsKey = "hasLaunchedBefore"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: userDefaultsKey)
        
        if !hasLaunchedBefore {
            KeychainSwift().clear()
            UserDefaults.standard.set(true, forKey: userDefaultsKey) // 플래그 설정
            UserDefaults.standard.synchronize() // 동기화
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

