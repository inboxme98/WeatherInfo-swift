/**
 *  City+Helper.swift
 *  WeatherInfo
 *  Purpose: This helper category is used to provide help for city objects at inset/update time
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */


import Foundation
extension City {
    
    /**
     * Summary: updateWeatherObjectsUsing:
     * This method is used to create weather info list using weather information
     *
     * @param $weatherInfo: weather information.
     *
     * @return:
     */
     func updateWeatherObjectsUsing(weatherInfo: NSDictionary) {
        
        self.associatedWeathers = nil;
        let  weatherData  = weatherInfo.value(forKey: WEATHER_DATA_RES_KEY) as! NSDictionary;
        let  weatherListInfo = weatherData.value(forKey: WEATHER_WEATHER_RES_KEY) as! NSArray
        
        var index = 0;
        for weatherInformation in weatherListInfo {
            
            let weather : Weather = CoreDataManager.createModelObject("Weather") as! Weather;
            weather.setModelProperties(weatherInformation as! NSDictionary);
            weather.parentCity = self;
            weather.dateOrder = Int16(index);
            index = index + 1;
        }
    }
    
}
