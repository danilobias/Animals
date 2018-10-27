//
//  Breeds.swift
//
//  Created by Danilo Bias Lago on 26/10/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Breeds {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let height = "height"
        static let lifeSpan = "life_span"
        static let breedGroup = "breed_group"
        static let id = "id"
        static let name = "name"
        static let bredFor = "bred_for"
        static let weight = "weight"
        static let temperament = "temperament"
    }
    
    // MARK: Properties
    public var height: Height?
    public var lifeSpan: String?
    public var breedGroup: String?
    public var id: Int?
    public var name: String?
    public var bredFor: String?
    public var weight: Weight?
    public var temperament: String?
    
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
        height = Height(json: json[SerializationKeys.height])
        lifeSpan = json[SerializationKeys.lifeSpan].string
        breedGroup = json[SerializationKeys.breedGroup].string
        id = json[SerializationKeys.id].int
        name = json[SerializationKeys.name].string
        bredFor = json[SerializationKeys.bredFor].string
        weight = Weight(json: json[SerializationKeys.weight])
        temperament = json[SerializationKeys.temperament].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        
        if let value = height {
            dictionary[SerializationKeys.height] = value.dictionaryRepresentation()
        }
        
        if let value = lifeSpan {
            dictionary[SerializationKeys.lifeSpan] = value
        }
        
        if let value = breedGroup {
            dictionary[SerializationKeys.breedGroup] = value
        }
        
        if let value = id {
            dictionary[SerializationKeys.id] = value
        }
        
        if let value = name {
            dictionary[SerializationKeys.name] = value
        }
        
        if let value = bredFor {
            dictionary[SerializationKeys.bredFor] = value
        }
        
        if let value = weight {
            dictionary[SerializationKeys.weight] = value.dictionaryRepresentation()
        }
        
        if let value = temperament {
            dictionary[SerializationKeys.temperament] = value
        }
        
        return dictionary
    }
    
}
