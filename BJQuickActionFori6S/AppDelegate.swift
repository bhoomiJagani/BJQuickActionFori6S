//
//  AppDelegate.swift
//  BJQuickActionFori6S
//
//  Created by arvaan on 2/1/16.
//  Copyright © 2016 Bhoomi. All rights reserved.
//

import UIKit
//Make value for case
enum ShortcutType: String {
    case VC = "com.arvaantechnolabs.BJQuickActionFori6S.VC"
    case VC1 = "com.arvaantechnolabs.BJQuickActionFori6S.VC1"
    case VC2 = "com.arvaantechnolabs.BJQuickActionFori6S.VC2"
   
}

let applicationShortcutUserInfoIconKey = "applicationShortcutUserInfoIconKey"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //=========================quick action=========================//
        var launchedFromShortCut = false
        //Check for ShortCutItem
        if #available(iOS 9.0, *) {
            if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
                
                launchedFromShortCut = true
                handleShortCutItem(shortcutItem,callFromAppLaunch: true)
                
                //Return false incase application was lanched from shorcut to prevent
                //application(_:performActionForShortcutItem:completionHandler:)
                return !launchedFromShortCut
                
            }
        }
        return true
    }

    //MARK:-
    //create a shortcut item using our new enum
    
    @available(iOS 9.0, *)
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: Bool -> Void) {
        
        let handledShortCutItem = handleShortCutItem(shortcutItem,callFromAppLaunch: false)
        completionHandler(handledShortCutItem)
    }
    
    @available(iOS 9.0, *)
    func handleShortCutItem(shortcutItem: UIApplicationShortcutItem,callFromAppLaunch:Bool) -> Bool {
        let handled = false
        //Get type string from shortcutItem
        if let shortcutType = ShortcutType.init(rawValue: shortcutItem.type) {
            
            //Get root navigation viewcontroller and its first controller
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            switch shortcutType {
            case .VC:
                
                print("Perform Event ViewController")
               
                let vcObj = mainStoryboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
                self.window!.rootViewController = vcObj
                
                break
                
            case.VC1:
                print("Perform Event For  ViewController1")
                
                let vc1Obj = mainStoryboard.instantiateViewControllerWithIdentifier("ViewController1") as! ViewController1
                let rootViewController = self.window!.rootViewController as! UINavigationController
                rootViewController.pushViewController(vc1Obj, animated: true)
                
                
                //========= move to vc2  from vc 1=============//
                NSNotificationCenter.defaultCenter().postNotificationName(kNotificationSwitchToVC2, object: nil)//---sidebarMenuVC -------///
                
                break
                
            case.VC2:
                print("Perform Event ForPending Request")
                //show alert view
                break
            }
           
        }
        return handled
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

