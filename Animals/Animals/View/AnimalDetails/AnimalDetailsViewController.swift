//
//  AnimalDetailsViewController.swift
//  Animals
//
//  Created by Danilo Bias Lago on 29/10/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit

class AnimalDetailsViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var animalImageView: UIImageView!
    
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var lifeSpan: UILabel!
    @IBOutlet weak var breedGroup: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bredFor: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var temperament: UILabel!

    // MARK: - Lets and Vars
    var animal: AnimalsResponse!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Details"
        self.showAnimalInfos()
    }
    
    
    func showAnimalInfos() {
        if let url = self.animal.url {
            self.animalImageView.load(urlString: url, placeholder: Constants.Placeholders.catImagePlaceholder)
        }
        
        let breed: Breeds = self.animal.breeds!.first!
        
        // TO-DO: Fazer tratamento dos textos dentro da model;
        self.height.text = "Height: " + (breed.height?.metric ?? "")
        self.lifeSpan.text = "Life Span: " + (breed.lifeSpan ?? "")
        self.breedGroup.text = "Breed Group:" + (breed.breedGroup ?? "")
        self.id.text = "Breed ID: \(breed.id)"
        self.name.text = "Name" + (breed.name ?? "")
        self.bredFor.text = "Bred For" + (breed.bredFor ?? "")
        self.weight.text = "Weight: " +  (breed.weight?.metric ?? "")
        self.temperament.text = "Temperament: " + (breed.temperament ?? "")
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
