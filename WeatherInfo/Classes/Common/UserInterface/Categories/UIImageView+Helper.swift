/**
 *  UIImageView+Helper.swift
 *  WeatherInfo
 *  Purpose: This category class is implemented for UIImageView.
 *
 *  Created by VK on 03/26/17.
 *  Copyright (c) 2017 VK. All rights reserved.
 */


import UIKit
import SDWebImage

extension UIImageView {
    
    /**
     * Summary: setImageFor
     * This method is used to set imgae using SDwebcache library
     *
     * @param $imageLink: image url.
     *
     * @return:
     */
    func setImageFor(_ imageLink:String?)  {
        
        if(imageLink != nil) {
            
            let imageURL : NSURL = NSURL(string: imageLink!)!;
            self.sd_setImage(with: imageURL as URL, placeholderImage: nil);
        }
    }
    
}
