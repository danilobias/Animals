//
//  CatsViewModel.swift
//  Animals
//
//  Created by Danilo Bias Lago on 26/10/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

protocol CatsViewModelProtocol: ListProtocol {
    var response: [AnimalsResponse]? { get }
    var responseDidChange: ((CatsViewModelProtocol) -> Void)? { get set }
}

class CatsViewModel: CatsViewModelProtocol {

    // MARK: - Vars
    var response: [AnimalsResponse]? {
        didSet{
            self.responseDidChange?(self)
        }
    }
    
    var url: String = Constants.APIUrls.searchCats
    var responseDidChange: ((CatsViewModelProtocol) -> Void)?
    
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
        
        CatsRequests.searchImages(withURL: url) { (animalsResponse, error) in
            print("CATS RESPONSE \(animalsResponse) - Error: \(error)")
            if let animals = animalsResponse {
                self.response = animals
            }
            
            if let errorDetail = error {
                completion(errorDetail)
            }
        }
    }

}
