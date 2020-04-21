//
//  Spells.swift
//  Wand
//
//  Created by SBAUser on 4/21/20.
//  Copyright © 2020 Michelle Espinosa. All rights reserved.
//

import Foundation

class Spells {
    private struct Returned: Codable {
        var results: [SpellData] = []
    }
    var spellArray: [SpellData] = []
    var url = "https://potterspells.herokuapp.com/api/v1/spells"
    
    
    func getData(completed: @escaping ()->()) {
        let urlString = url
        print("We are acessing the url \(urlString)")
        
        // Create a URL
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not creat a URL from \(urlString)")
            completed()
            return
        }
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
            print("ERROR: \(error.localizedDescription)")
        }
            do{
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                self.spellArray = returned.results
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
    }
        task.resume()
    }
}

