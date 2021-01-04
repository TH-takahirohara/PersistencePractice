//
//  TwitterJSON.swift
//  TwitterTweet
//
//  Created by 原昂大 on 2020/12/10.
//

import Foundation

struct TwitterJSON {
    static let tweet: [String: Any] = [
        "id": 20,
        "created_at": "Tue Mar 21 20:50:14 +0000 2006",
        "text": "just setting up my twttr",
        "user": user
    ]
    
    static let user: [String: Any] = [
        "id": 12,
        "name": "Jack Dorsey",
        "screen_name": "jack",
        "profile_image_url_https": "https://abs.twimg.com/sticky/default_profile_images/default_profile_0_normal.png"
    ]
}
