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
        try! realm.write {
            realm.add([Person(value: ["name": "A", "age": 20]),
                       Person(value: ["name": "B", "age": 20, "countryCode": "jp"]),
                       Person(value: ["name": "C", "age": 15, "countryCode": "jp"])])
        }
        
        var results = realm.objects(Person.self)
        results = results.filter("age >= 18 && countryCode = 'jp'")
        print("results: \(results)")
    }
}
