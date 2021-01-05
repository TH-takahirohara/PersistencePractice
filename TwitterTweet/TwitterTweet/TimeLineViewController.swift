//
//  TimeLineViewController.swift
//  TwitterTweet
//
//  Created by 原昂大 on 2021/01/06.
//

import UIKit
import RealmSwift

class TimeLineViewController: UIViewController {
    
    override func awakeFromNib() {
        let realm = try! Realm()
        try! realm.write {
            let tweet = Tweet(value: TwitterJSON.tweet)
            
            realm.add(tweet, update: .modified)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
