/**
 *  Weather+Helper.swift
 *  WeatherInfo
 *  Purpose: This helper category is used to provide help for weather objects at insert/update time
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */


import Foundation
extension Weather {
    
    
    /**
     * Summary: setModelProperties
     * This method is used to set weather properties from dictionary
     *
     * @param $weatherInfo: weather info.
     *
     * @return:
     */
    func setModelProperties(_ weatherInfo:NSDictionary) {
        
        if ((weatherInfo.value(forKey: WEATHER_DATE_RES_KEY)) != nil &&
            !(weatherInfo.value(forKey: WEATHER_DATE_RES_KEY) is NSNull)) {
            
            self.date = (weatherInfo.value(forKey: WEATHER_DATE_RES_KEY) as! String).components(separatedBy: "-").last;
        }
        if ((weatherInfo.value(forKey: WEATHER_TEMP_RES_KEY)) != nil &&
            !(weatherInfo.value(forKey: WEATHER_TEMP_RES_KEY) is NSNull)) {
            
            self.temperature = (weatherInfo.value(forKey: WEATHER_TEMP_RES_KEY) as! String);
        }
        if ((weatherInfo.value(forKey: WEATHER_ICON_RES_KEY)) != nil &&
            !(weatherInfo.value(forKey: WEATHER_ICON_RES_KEY) is NSNull)) {
            
            let iconList : Array = weatherInfo.value(forKey: WEATHER_ICON_RES_KEY) as! Array<Any>;
            let iconInfo : Dictionary = (iconList.first as? Dictionary<String,String>)!;
            self.weatherIcon = iconInfo[WEATHER_ICON_VALUE_RES_KEY]!;
        }
    }
    
}
