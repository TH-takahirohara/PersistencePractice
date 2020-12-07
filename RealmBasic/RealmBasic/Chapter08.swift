//
//  Chapter08.swift
//  RealmBasic
//
//  Created by 原昂大 on 2020/11/29.
//

import Foundation
import RealmSwift

class Animal: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}

class Dog: Animal {
}

class Cat: Animal {
}

class UniqueObject: Object {
    @objc dynamic var id = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
