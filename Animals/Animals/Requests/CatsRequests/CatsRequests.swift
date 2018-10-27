//
//  CatsRequests.swift
//  Animals
//
//  Created by Danilo Bias Lago on 26/10/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit
import SwiftyJSON

class CatsRequests: NSObject {

    static func searchImages(withURL url: String, completion: @escaping(AnimalsResponse?, Error?) -> Void) {
        BaseRequest.get(url) { (result) in
            if let data = result as? Data {
                
                let json: JSON = JSON(data)
                let movieDetail: AnimalsResponse = AnimalsResponse(json: json)
                completion(movieDetail, nil)
                
            }else if let error = result as? Error {
                completion(nil, error)
            }else{
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }
}
