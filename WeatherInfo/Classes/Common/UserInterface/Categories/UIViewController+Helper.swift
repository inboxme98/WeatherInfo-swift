/**
 *  UIViewController+Helper.swift
 *  WeatherInfo
 *  Purpose: This category class is implemented for UIViewController to perform common operations.
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import UIKit

extension UIViewController {
    
    /**
     * Summary: showAlertMessageWithoutHandler
     * This method is used to show alert with given action handlers
     *
     * @param $title: alert title.
     * @param $message: alert message.
     * @param $handlerList: alert action list.
     *
     * @return:
     */
    func showAlertMessageWithoutHandler(title:String?,
                                        message:String?,
                                        handlerList:Array<UIAlertAction> ) {
        
        let alertController  = UIAlertController(title: title,
                                                 message:message,
                                                 preferredStyle: .alert);
       
        for alertAction in handlerList {
            alertController.addAction(alertAction);
        }

        self.present(alertController, animated: true, completion: nil);
    }
    
}
