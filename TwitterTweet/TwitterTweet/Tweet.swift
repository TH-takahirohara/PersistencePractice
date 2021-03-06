//
//  Tweet.swift
//  TwitterTweet
//
//  Created by 原昂大 on 2021/01/05.
//

import Foundation
import RealmSwift

class Tweet: Object {
    @objc dynamic var id = 0
    @objc dynamic var created_at = ""
    @objc dynamic var text = ""
    @objc dynamic var user: User?
    
    var date: String {
        let date = TwitterDateFormatter.api.date(from: created_at)!
        return TwitterDateFormatter.absolute.string(from: date)
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
