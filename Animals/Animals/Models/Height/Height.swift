//
//  Height.swift
//
//  Created by Danilo Bias Lago on 26/10/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Height {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let metric = "metric"
        static let imperial = "imperial"
    }
    
    // MARK: Properties
    public var metric: String?
    public var imperial: String?
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public init(json: JSON) {
        metric = json[SerializationKeys.metric].string
        imperial = json[SerializationKeys.imperial].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        
        if let value = metric {
            dictionary[SerializationKeys.metric] = value
        }
        
        if let value = imperial {
            dictionary[SerializationKeys.imperial] = value
        }
        
        return dictionary
    }
    
}
