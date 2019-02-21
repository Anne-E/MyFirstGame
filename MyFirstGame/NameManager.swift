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
    // isValid func that verifies if the name chosen has already been used
    public func isValid(name: String) -> Bool {
        if !name.isEmpty && !names.contains(name) {
            names.append(name)
            return true
        } else {
            return false
        }
    }
}
