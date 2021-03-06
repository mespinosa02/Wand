//
//  ViewController.swift
//  Wand
//
//  Created by SBAUser on 4/21/20.
//  Copyright © 2020 Michelle Espinosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
//    var spells = ["Accio Dittany", "Accio Firebolt", "Accio Locket"]
    var spells = Spells()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        spells.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TEchnically dont need an if since there is only one segway
        // and that means we also dont need and else clause here, either
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! SpellDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.spellData = spells.spellArray[selectedIndexPath.row]
            
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        spells.spellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = spells.spellArray[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
