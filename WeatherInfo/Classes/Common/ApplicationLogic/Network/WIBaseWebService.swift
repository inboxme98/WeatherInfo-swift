/**
 *  WIBaseWebService.swift
 *  WeatherInfo
 *  Purpose: This class is used as a base class for web services.
 *
 *  Created by VK on 03/26/17
 *  Copyright (c) 2017 VK. All rights reserved.
 */

import UIKit
import Alamofire

class WIBaseWebService: NSObject {
    
    var requestBodyInfo : Dictionary? = [String : [String : Any]] ()
    
    /**
     * Summary: baseURL
     * This method is used to return base url for web service
     *
     * @return: base url
     */
    func baseURL() -> String {
        
        return WI_WEBSERVICE_BASE_URL;
    }
    
    /**
     * Summary: relativeURL
     * This method is used to return relative url for web service
     *
     * @return: relative url
     */
    func relativeURL() -> String {
        
        return "";
    }
    
    /**
     * Summary: completeURL
     * This method is used to return complete url for web service
     *
     * @return: complete url
     */
    func completeURL() -> String {
        
        return self.baseURL()+self.relativeURL();
    }
    
    /**
     * Summary: getMethodName
     * This method is used to return web service method name
     *
     * @return: complete url
     */
    func getMethodName() -> String {
        
        return GET_REQUEST_TYPE;
        
    }
    
    /**
     * Summary: executeRequest
     * This method is used to execute web service
     *
     * @param $completion: completetion block which is called after recevied response.
     *
     * @return: complete url
     */
    func executeRequest(completion: @escaping (_ result: Any?, _ error:Error?) -> Void)  {
        
        
        if self.getMethodName() == GET_REQUEST_TYPE {
            
            Alamofire.request(self.completeURL()).responseJSON { response in
                
                if(response.error != nil) {
                    
                    print("error")
                    completion(nil,response.error);
                } else {
                    
                     completion(self.performActionOnResponse(response.data),nil);
                  
                }
            }
        }
    }
    
    
    /**
     * Summary: performActionOnResponse
     * This method is used to perform action on recevied server response
     *
     * @param $responseObject: server response.
     *
     * @return: object to send on call back owner
     */
    func performActionOnResponse(_ responseObject: Any?) -> Any? {
        
        return responseObject;
        
    }
    
}
