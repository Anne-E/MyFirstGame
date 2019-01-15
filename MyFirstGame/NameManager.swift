//
//  NameManager.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 18/12/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

class NameManager {
  private var names = [String]()
    
    // function isValide vérifie si le nom entré a déjà était utilisé
    public func isValid(name: String) -> Bool {
        if !name.isEmpty && !names.contains(name) {
            names.append(name)
            return true
        }
        else {
            return false
        }
    }
}
