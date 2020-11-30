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
        let results = realm.objects(Person.self)
        print("results.count: \(results.count)")
        
        try! realm.write {
            realm.add(Person())
        }
        print("results.count: \(results.count)")
    }
}
