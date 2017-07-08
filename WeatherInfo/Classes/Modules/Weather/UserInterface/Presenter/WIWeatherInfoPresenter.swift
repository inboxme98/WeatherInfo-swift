/**
 *  WIWeatherInfoPresenter.swift
 *  WeatherInfo
 *  Purpose: This is a presenter class for weather info module and perform operation which is used to render weather info screen.
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import UIKit

class WIWeatherInfoPresenter {

    static let sharedInstance = WIWeatherInfoPresenter()
    
    /**
     * Summary: fetchWeatherList
     * This method is used to sent request to server for fetching weather info for given city
     *
     * @param $city: city object.
     * @param $completion: call back method.
     *
     * @return:
     */
    func fetchWeatherList(for city: City, completion: @escaping (_ result: Any?, _ error : Error?) -> Void) {
        
    
           
            city.fetchWeatherInfoList(completion:{
                (responseObject: Any?, error : Error?) in
                
                completion(responseObject,error);
            });
    }
    
    /**
     * Summary: getWeatherCity
     * This method is used to get city object for given city name
     *
     * @param $cityName: city name.
     *
     * @return: city object
     */
    func getWeatherCity(for cityName:String) -> City {
        
        let cityPredicate = NSPredicate(format: "cityName contains[c] %@", cityName);
        
        var weatherCity : City? = CoreDataManager.getModelObjectList(NSStringFromClass(City.self), withPedicate: cityPredicate, andSortedBy: nil).first as? City;
        if(weatherCity == nil) {
            
            weatherCity = (CoreDataManager.createModelObject("City") as! City);
            weatherCity?.cityName = cityName;
            
        }
        CoreDataManager.saveContext();
        return weatherCity!;
    }
 
 
}
