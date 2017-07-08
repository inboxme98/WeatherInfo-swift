/**
 *  City+Sender.swift
 *  WeatherInfo
 *  Purpose: This sender category is used to provide request help for city objects
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */

extension City {

    /**
     * Summary: fetchWeatherInfoList
     * This method is used sent request to server for fetching weather info
     *
     * @param $completion: call back method.
     *
     * @return:
     */
    func fetchWeatherInfoList(completion: @escaping (_ result: Any?, _ error : Error?) -> Void) {
        
        let weatherInfoService : WIWeatherInfoWebService = WIWeatherInfoWebService();
        weatherInfoService.city = self;
        weatherInfoService.executeRequest(completion:{
            (responseObject: Any?, error : Error?) in
            
            completion(responseObject,error);
        })
        ;
    }
    
}
