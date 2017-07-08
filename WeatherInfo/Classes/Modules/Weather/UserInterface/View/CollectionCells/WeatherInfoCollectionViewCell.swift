/**
 *  WeatherInfoCollectionViewCell.swift
 *  WeatherInfo
 *  Purpose: This collection cell is used to show a weather info.
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import UIKit

class WeatherInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var  lblTemp : UILabel!;
    @IBOutlet weak var  lblDate : UILabel!;
    @IBOutlet weak var  weatherIconView : UIImageView!;
    
    /**
     * Summary: setupViewForWeatherInfo:
     * This method is used to set collection cell for given weather info object
     *
     * @param $weatherObject: weather info object
     *
     * @return:
     */
    func setupViewForWeatherInfo(_ weatherObject : Weather) {
        
        lblDate.text = weatherObject.date;
        lblTemp.text = weatherObject.temperature + "\u{00B0}";
        weatherIconView.setImageFor(weatherObject.weatherIcon);
        
    }
    
}
