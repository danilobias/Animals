//
//  AnimalsResponse.swift
//
//  Created by Danilo Bias Lago on 26/10/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct AnimalsResponse {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let id = "id"
        static let categories = "categories"
        static let url = "url"
        static let breeds = "breeds"
    }
    
    // MARK: Properties
    public var id: String?
    public var categories: [CategoryResponse]?
    public var url: String?
    public var breeds: [Breeds]?
    
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
        id = json[SerializationKeys.id].string
        url = json[SerializationKeys.url].string
        
        if let items = json[SerializationKeys.categories].array {
            categories = items.map { CategoryResponse(json: $0) }
        }

        if let items = json[SerializationKeys.breeds].array {
            breeds = items.map { Breeds(json: $0) }
        }
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        
        if let value = id {
            dictionary[SerializationKeys.id] = value
        }
        
        if let value = categories {
            dictionary[SerializationKeys.categories] = value.map { $0.dictionaryRepresentation() }
        }
        
        if let value = url {
            dictionary[SerializationKeys.url] = value
        }
        
        if let value = breeds {
            dictionary[SerializationKeys.breeds] = value.map { $0.dictionaryRepresentation() }            
        }
        
        return dictionary
    }
    
}
