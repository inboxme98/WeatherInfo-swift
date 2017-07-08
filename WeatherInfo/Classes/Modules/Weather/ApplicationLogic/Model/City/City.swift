/**
 *  City.swift
 *  WeatherInfo
 *  Purpose: This class is used to describe City object
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import Foundation
import CoreData

public class City: NSManagedObject {
    
    @NSManaged public var cityName: String?
    @NSManaged public var associatedWeathers: NSSet?

}
