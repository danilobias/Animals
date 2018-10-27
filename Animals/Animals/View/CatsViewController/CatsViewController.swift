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
        // Do any additional setup after loading the view.
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
        // Pass the selected object to the new view controller.
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
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderIdentifier", for: indexPath) as? SectionHeader {
//            return sectionHeader
//        }
//        return UICollectionReusableView()
//    }
}


