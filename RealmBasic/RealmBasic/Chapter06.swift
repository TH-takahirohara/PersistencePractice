//
//  Chapter06.swift
//  RealmBasic
//
//  Created by 原昂大 on 2020/11/28.
//

import Foundation
import RealmSwift

class Person: Object {
    dynamic var name = ""
    dynamic var age = 0
    dynamic var dog: Dog?
    let cats = List<Cat>()
}

class Animal: Object {
    dynamic var name = ""
    dynamic var age = 0
}

class Dog: Animal {
}

class Cat: Animal {
}
