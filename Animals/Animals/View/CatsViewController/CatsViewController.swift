//
//  CatsViewController.swift
//  Animals
//
//  Created by Danilo Bias Lago on 26/10/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

class CatsViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var catsCollectionView: UICollectionView!
    
    // MARK: - Lets and Vars
    var catsViewModel: CatsViewModel! {
        didSet {
            catsViewModel.responseDidChange = { [weak self] viewModel in
                self?.catsCollectionView.reloadData()
                self?.hideLoading()                
            }
        }
    }
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cats"
        // Do any additional setup after loading the view.
        self.catsViewModel = CatsViewModel()
        self.makeGenresRequest()

    }
    
    // MARK: - Requests
    func makeGenresRequest() {
        self.showLoading()
        self.catsViewModel.getElement(completion: { (error) in
            // TO-DO: Tratar erro
            self.hideLoading()
        })
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if let destination = segue.destination as? AnimalDetailsViewController {
            destination.animal = sender as! AnimalsResponse
        }
    }
    
    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CatsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.catsViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AnimalsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalsCollectionViewCell", for: indexPath) as! AnimalsCollectionViewCell
        let cat: AnimalsResponse = self.catsViewModel.getAnimalsResponseBy(index: indexPath.row)
        cell.configCellWith(cat: cat)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let dog: AnimalsResponse = self.catsViewModel.getAnimalsResponseBy(index: indexPath.row)
        if dog.breeds != nil && dog.breeds!.count > 0 {
            self.performSegue(withIdentifier: "ShowCatDetails", sender: dog)
        }
    }

}


