//
//  StateData.swift
//  PocketFauci
//
//  Created by John Gallaugher on 11/23/20.
//

import Foundation

struct StateData: Codable {
    var state = ""
    var positive = 0
    var hospitalizedCurrently: Int? = 0
    var death = 0
}
