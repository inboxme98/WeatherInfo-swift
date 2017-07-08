/**
 *  WIWeatherInfoWebService.swift
 *  WeatherInfo
 *  Purpose: This web service is used to fetch weather info list from server.
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import UIKit

class WIWeatherInfoWebService: WIBaseWebService {
    
    var city : City?
    let numberOFDays  = 5

    /**
     * Summary: relativeURL
     * This method is used to return relative url for web service
     *
     * @return: relative url
     */
    override func relativeURL() -> String {
        
        return String(format: WI_WEATHER_INFO_LIST_URL, (city?.cityName)!,WI_RES_FORMATE,numberOFDays);
    }
    
    /**
     * Summary: performActionOnResponse
     * This method is used to perform action on downloaded photo weather info from server
     *
     * @param $responseObject: server response.
     *
     * @return: object to send on call back owner
     */
    override func performActionOnResponse(_ responseObject: Any?) -> Any? {
       
        let weatherListInfo = try? JSONSerialization.jsonObject(with: responseObject as! Data, options: .allowFragments);
        city?.updateWeatherObjectsUsing(weatherInfo: (weatherListInfo as? NSDictionary)!);
        CoreDataManager.saveContext();
        return city;
        
    }
    
}
