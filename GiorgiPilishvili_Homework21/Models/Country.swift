//
//  Country.swift
//  GiorgiPilishvili_Homework21
//
//  Created by GIORGI PILISSHVILI on 10.08.22.
//

import Foundation

struct Country: Codable {
    let name: String
    let capital: String?
    let region: String
    let subregion: String
    let flags: Flags
}

struct Flags: Codable {
    let png: String
    let svg: String
}
