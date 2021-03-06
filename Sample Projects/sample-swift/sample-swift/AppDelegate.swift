//
//  AppDelegate.swift
//  sample-swift
//
//  Copyright (c) 2015 Batch.com. All rights reserved.
//

import UIKit
import Batch.Unlock
import Batch.Ads

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, BatchUnlockDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        BatchUnlock.setupUnlockWithDelegate(self)
        BatchAds.setAutoLoad(false)
        BatchAds.setupAds()
        Batch.startWithAPIKey("YOUR API KEY")
        
        return true
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

    // MARK: BatchUnlockDelegate methods
    
    func automaticOfferRedeemed(offer: BatchOffer) {
        println("Automatically redeemed an offer: \(offer.offerReference())")
        UnlockManager().unlockItemsFromOffer(offer)
        UnlockManager().showRedeemAlert(offer, viewController: (window?.rootViewController)!)
    }
    
    func URLWithCodeFound(code: String!) {
        println("Redeeming Magic Link with code: \(code)")
    }
    
    func URLWithCodeRedeemed(offer: BatchOffer) {
        println("Redeemed Magic Link")
        UnlockManager().unlockItemsFromOffer(offer)
    }
    
    func URLWithCodeFailed(error: BatchError!) {
        println("Failed to redeem Magic Link \(error.localizedDescription())")
    }
}

