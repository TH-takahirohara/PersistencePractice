//
//  ViewController.swift
//  RealmBasic
//
//  Created by 原昂大 on 2020/11/28.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var token: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testRealmNotification()
    }
    
    func testRealmNotification() {
        let realm = try! Realm()
        
        token = realm.observe({ (notification, realm) in
            switch notification {
            case .didChange:
                print("didChange: 更新されました")
            case .refreshRequired:
                print("その他")
            }
        })
        
        try! realm.write {
            realm.add(Person(value: ["name": "test"]))
        }
    }
}
