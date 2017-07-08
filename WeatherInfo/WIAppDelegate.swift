/**
 *  WIAppDelegate.swift
 *  WeatherInfo
 *  Purpose: This app delgate is used to perform application level methods.
 *
 *  Created by VK on 03/26/17.
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import UIKit

@UIApplicationMain
class WIAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? // Application window

    /**
     * Summary: application
     * This method is called on application launch
     *
     * @param $application: Application object.
     * @param $launchOptions: App launching parameters.
     *
     * @return: Launching state
     */
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        WIAppDelegateHelper.setupLaunchProperties();
        WIAppDelegateHelper.addRootViewControllerInWindow(window!);
        return true
    }

}

