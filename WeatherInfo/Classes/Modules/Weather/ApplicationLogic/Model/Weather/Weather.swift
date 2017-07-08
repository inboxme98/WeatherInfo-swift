/**
 *  Weather.swift
 *  WeatherInfo
 *  Purpose: This class is used to describe City object
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import Foundation
import CoreData


public class Weather: NSManagedObject {
    
    @NSManaged public var date: String?
     @NSManaged public var dateOrder: Int16
    @NSManaged public var temperature: String
    @NSManaged public var weatherIcon: String?
    @NSManaged public var parentCity: City?

}
