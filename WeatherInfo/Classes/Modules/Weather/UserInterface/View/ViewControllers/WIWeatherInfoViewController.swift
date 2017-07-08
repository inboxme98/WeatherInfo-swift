/**
 *  WIWeatherInfoViewController.swift
 *  WeatherInfo
 *  Purpose: This controller class is used to show weather information.
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */


import UIKit

class WIWeatherInfoViewController: UIViewController {
    
    var cityWeather : City?
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var  weatherInfoView : WeatherInfoView!;
  
    
    /**
     * Summary: viewDidLoad
     * This method is called one time when view is loaded
     *
     * @return:
     */
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cityTextField.text = AppUtility.getCityName();
        self.setUpWeatherView();
    }
    
    /**
     * Summary: setUpWeatherView
     * This method is called to weather info view
     *
     * @return:
     */
    func setUpWeatherView() {
      
        let weatherInfoPresenter = WIWeatherInfoPresenter.sharedInstance;
        if((cityTextField.text != nil) &&
            (cityTextField.text?.characters.count)! > 0) {
            
            AppUtility.setCityName(city:cityTextField.text!);
            cityWeather = weatherInfoPresenter.getWeatherCity(for:cityTextField.text!);
            self.weatherInfoView.setWeatherInfoViewForCity(self.cityWeather!);
            self.fetchWeatherInfoList();
        }
    }
    
    /**
     * Summary: fetchWeatherInfoList
     * This method is used to fetch weather info list
     *
     * @return:
     */
    func fetchWeatherInfoList()  {
        
        let weatherInfoPresenter = WIWeatherInfoPresenter.sharedInstance;
        weatherInfoPresenter.fetchWeatherList(for:cityWeather!, completion:{
            (responseObject: Any?, error : Error?) in
            
            if(error == nil) {
                
                if((responseObject as? City) == nil) {
                    
                    let defaultAction = UIAlertAction(title: OK_STRING, style: .default, handler: nil);
                    self.showAlertMessageWithoutHandler(title: EMPTY_STRING,
                                                        message: WEATHER_INFO_DOWNLOAD_FAIL_ERROR_MESSAGE,
                                                        handlerList: [defaultAction]);
                } else {
                    
                    self.cityWeather = responseObject as? City;
                    self.weatherInfoView.setWeatherInfoViewForCity(self.cityWeather!);
                }
                
            } else {
                
                let retryAction = UIAlertAction(title: RETRY_STRING,
                                                style: .default,
                                                handler: {(alert: UIAlertAction!) in
                                                    self.fetchWeatherInfoList();
                });
                let defaultAction = UIAlertAction(title: OK_STRING, style: .default, handler: nil);
                
                
                self.showAlertMessageWithoutHandler(title:EMPTY_STRING,
                                                    message: error?.localizedDescription,
                                                    handlerList: [retryAction,defaultAction]);
                
            }
        })
    }
    
    //  #pragma mark - text field methods
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
   
        self.setUpWeatherView();
        textField.resignFirstResponder();
        return true;
    }
    
}

