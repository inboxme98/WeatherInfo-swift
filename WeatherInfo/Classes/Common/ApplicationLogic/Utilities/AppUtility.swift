/**
 *  AppUtility.swift
 *  WeatherInfo
 *  Purpose: This utility class is used to save and get app level data
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import UIKit

class AppUtility: NSObject {
    
    /**
     * Summary: getCityName
     * This method is save city name
     *
     * @param $city: city name.
     *
     * @return:
     */
    class func setCityName(city:String) {
        
        UserDefaults.standard.set(city, forKey: "CityName")
        UserDefaults.standard.synchronize()
    }
    
    /**
     * Summary: getCityName
     * This method is get last saved city name
     *
     * @return: city name
     */
    class func getCityName() -> String {
        
        var cityName = UserDefaults.standard.value(forKey: "CityName") as? String;
        if(cityName == nil ||
            cityName?.characters.count == 0) {
           
            cityName = "Bangalore";
        }
        
        return cityName!;
        
    }

}
