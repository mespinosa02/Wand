//
//  SpellDetailViewController.swift
//  Wand
//
//  Created by SBAUser on 4/21/20.
//  Copyright © 2020 Michelle Espinosa. All rights reserved.
//

import UIKit

class SpellDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var spellData: SpellData!

    override func viewDidLoad() {
        super.viewDidLoad()

        // likely will never ocurr, but you can...
        if spellData == nil {
            spellData = SpellData(name: "", description: "", soundFile: "")
        }
        
        
        updateUserInterface()
    }
    func updateUserInterface() {
        nameLabel.text = spellData.name
        descriptionLabel.text = spellData.description
    }
}
