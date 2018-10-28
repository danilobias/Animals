//
//  DogsViewModel.swift
//  Animals
//
//  Created by Danilo Bias Lago on 28/10/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

protocol DogsViewModelProtocol: ListProtocol {
    var response: [AnimalsResponse]? { get }
    var responseDidChange: ((DogsViewModelProtocol) -> Void)? { get set }
}

class DogsViewModel: DogsViewModelProtocol {
    
    // MARK: - Vars
    var url: String = Constants.APIUrls.searchDogs
    var limit: Int = 50
    
    var response: [AnimalsResponse]? {
        didSet{
            self.responseDidChange?(self)
        }
    }
    
    var responseDidChange: ((DogsViewModelProtocol) -> Void)?
    
    // MARK: - Methods
    required init() {}
    
    
    // MARK: - Utils
    func numberOfRows() -> Int{
        return response?.count ?? 0
    }
    
    func getAnimalsResponseBy(index: Int) -> AnimalsResponse {
        return response![index]
    }
    
    // MARK: - Request
    func getElement(completion: @escaping (Error?) -> Void) {
        
        let params: [String: Any] = ["limit": limit]
        
        AnimalsRequests.searchImages(withURL: url, params: params) { (animalsResponse, error) in
            
            if let animals = animalsResponse {
                self.response = animals
            }
            
            if let errorDetail = error {
                completion(errorDetail)
            }
        }
    }
}
