//
//  ViewController.swift
//  RealmBasic
//
//  Created by 原昂大 on 2020/11/28.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let cat1 = Cat(value: ["name": "cat1", "age": 3])
        let cat2 = Cat(value: ["name": "cat2", "age": 5])
        let cat3 = Cat(value: ["name": "cat3", "age": 10])
        
        try! realm.write {
            realm.deleteAll()
        }
        try! realm.write {
            realm.add([Person(value: ["name": "A", "age": 10, "cats": [cat1]]),
                       Person(value: ["name": "B", "age": 20, "cats": [cat1, cat2]]),
                       Person(value: ["name": "C", "age": 15, "cats": [cat1, cat2, cat3]])])
        }

        var results = realm.objects(Person.self)
         
        
        print("results ANY: \(results.filter("ANY cats.age == 10"))")
        print("results NONE: \(results.filter("NONE cats.age == 5"))")
        print("results IN: \(results.filter("age IN {15, 20, 25}"))")
    }
}
