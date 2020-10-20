//
//  ViewController.swift
//  PersistencePractice
//
//  Created by 原昂大 on 2020/10/20.
//  Copyright © 2020 takahiro.hara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Int
        UserDefaults.standard.set(10, forKey: "Int")
        print(UserDefaults.standard.integer(forKey: "Int"))
        
        // Dictionary
        let dict: [String: Int] = ["first": 1, "second": 2, "third": 3]
        UserDefaults.standard.set(dict, forKey: "dict")
        
        if let dict = UserDefaults.standard.dictionary(forKey: "dict") as? [String: Int] {
            print(dict["first"]!)
            print(type(of: dict["first"]!))
        }
        
        // 用意されていない型
        let date = Date()
        UserDefaults.standard.setValue(date, forKeyPath: "date")
        if let date = UserDefaults.standard.object(forKey: "date") as? Date {
            print(date)
        }
        
        // 削除
        UserDefaults.standard.removeObject(forKey: "Int")
        print(UserDefaults.standard.integer(forKey: "Int")) // 0
        
        UserDefaults.standard.removeObject(forKey: "dict")
        print(UserDefaults.standard.dictionary(forKey: "dict")) // nil
    }


}

