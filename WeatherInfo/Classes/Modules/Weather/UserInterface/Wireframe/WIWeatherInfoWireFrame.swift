/**
 *  WIWeatherInfoWireFrame.swift
 *  WeatherInfo
 *  Purpose: This wireframe is used to prepare weather info screen.
 *
 *  Created by VK on 03/26/17.
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import UIKit

class WIWeatherInfoWireFrame: NSObject {
    
    /**
     * Summary: showWeatherInfoAsRootControllerInWindow
     * This method is used to prepare weather info  screen as root controller
     *
     * @param $window: application window.
     *
     * @return:
     */
    class func showWeatherInfoAsRootControllerInWindow(_ window : UIWindow)  {
        
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Weather", bundle: nil);
        let weatherInfoViewController : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "WIWeatherInfoViewController") ;
        window.rootViewController = weatherInfoViewController;
    }
    
    
}
