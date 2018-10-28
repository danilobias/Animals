//
//  DogsViewController.swift
//  Animals
//
//  Created by Danilo Bias Lago on 28/10/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

class DogsViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var dogsCollectionView: UICollectionView!
    
    // MARK: - Lets and Vars
    var dogsViewModel: DogsViewModel! {
        didSet {
            dogsViewModel.responseDidChange = { [weak self] viewModel in
                self?.dogsCollectionView.reloadData()
                self?.hideLoading()
            }
        }
    }
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.dogsViewModel = DogsViewModel()
        self.makeGenresRequest()
        
    }
    
    // MARK: - Requests
    func makeGenresRequest() {
        self.showLoading()
        self.dogsViewModel.getElement(completion: { (error) in
            // TO-DO: Tratar erro
            self.hideLoading()
        })
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DogsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dogsViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AnimalsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalsCollectionViewCell", for: indexPath) as! AnimalsCollectionViewCell
        let dog: AnimalsResponse = self.dogsViewModel.getAnimalsResponseBy(index: indexPath.row)
        cell.configCellWith(cat: dog)
        
        return cell
    }
}
