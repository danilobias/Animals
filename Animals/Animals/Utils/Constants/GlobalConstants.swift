//
//  GlobalConstants.swift
//  Animals
//
//  Created by Danilo Bias Lago on 26/10/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

struct Constants {
    
    //MARK: URL's e métodos
    struct APIPreffix {
        static let urlCatPreffix: String = "https://api.thecatapi.com/v1/"
        static let urlDogPreffix: String = "https://api.thedogapi.com/v1/"
    }
    
    struct APIKeys {
        static let apiKeyCats: String = "0dde82cb-9a5b-4161-a264-32b6ea234f33"
        static let apiKeyDogs: String = "c93f79f2-2c0c-414b-adf9-c4fd2a7a687c"
    }
    
    struct URLPaths {
        static let commonPath: String = "/"
        static let concatKey: String = "&"
        static let question: String = "?"
    }
    
    struct CommonMethods {
        static let images: String = "images"
        static let search: String = "search"
    }
    
    struct CatsMethods {
        
    }
    
    struct DogsMethods {
    }
    
    struct APIUrls {
        
        static let searchCats: String = Constants.APIPreffix.urlCatPreffix + CommonMethods.images + URLPaths.commonPath + CommonMethods.search + URLPaths.question
        static let searchDogs: String = Constants.APIPreffix.urlDogPreffix + CommonMethods.images + URLPaths.commonPath + CommonMethods.search + URLPaths.question
    }
    
    struct Placeholders {
        static let catImagePlaceholder: String = "ic_cat_large"
    }
}
