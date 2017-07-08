/**
 *  WIInterfaceStringConstants.swift
 *  WeatherInfo
 *  Purpose: This constant class is used to store UI string constant.
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import Foundation

let		MAIN_BUNDLE                           =  Bundle.main;

//#pragma mark - Common string

let   EMPTY_STRING                            =      "      "
let   OK_STRING                                =     NSLocalizedString("1001", tableName: nil, bundle: MAIN_BUNDLE, value: "OK", comment:"OK string");
let   RETRY_STRING                                =     NSLocalizedString("1001", tableName: nil, bundle: MAIN_BUNDLE, value: "Retry", comment:"Retry string");

//#pragma mark - Weather info strings

let  WEATHER_INFO_DOWNLOAD_FAIL_ERROR_MESSAGE            =     NSLocalizedString("1101",tableName: nil,bundle: MAIN_BUNDLE,value: "Not able to download weather information",comment:"weather info dowload fail alert message")




