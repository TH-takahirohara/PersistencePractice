//
//  User.swift
//  TwitterTweet
//
//  Created by 原昂大 on 2021/01/04.
//

import Foundation
import RealmSwift

class User: Object {
    
    @objc dynamic var id = 0 // 一意の数値ID(変更不可でTwitterアカウントを作成時に自動で与えられる)
    @objc dynamic var name = "" // 名前
    @objc dynamic var screen_name = "" // スクリーンネーム（変更可能な一意の文字列ID）
    @objc dynamic var profile_image_url_https = "" // プロフィール画像URL
    
    /**
     プライマリキーとするプロパティ名を返す。
     */
    override class func primaryKey() -> String? {
        return "id" // idをプライマリキーに指定する
    }
    
}
