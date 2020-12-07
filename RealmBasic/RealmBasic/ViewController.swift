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
        
        migration()
    }
    
    deinit {
        token?.invalidate()
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
            realm.add(Cat(value: ["name": "test"]))
        }
    }
    
    func testObjectNotification() {
        let realm = try! Realm()
        
        let object = Cat(value: ["name": "Tama"])
        
        try! realm.write {
            realm.add(object)
        }
        
        token = object.observe({ (change) in
            switch change {
            case .change(let properties):
                print("object value changed: 変更がありました")
            case .deleted:
                print("object deleted: 削除されました")
            case .error(let error):
                print("error")
            }
        })
        
        try! realm.write {
            object.name = "Pochi"
        }
        
        try! realm.write {
            realm.delete(object)
        }
    }
    
    func migration() {
        var config = Realm.Configuration()
        
        config.migrationBlock = { (migration, oldSchemeVersion) in
            print("migrated")
        }
        
        config.schemaVersion = 1
        
//        let realm = try! Realm(configuration: config)
    }
}
