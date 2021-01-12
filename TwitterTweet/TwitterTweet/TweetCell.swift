//
//  TweetCell.swift
//  TwitterTweet
//
//  Created by 原昂大 on 2021/01/09.
//

import UIKit

class TweetCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    weak var imageTask: URLSessionDataTask?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageTask?.cancel()
        userImageView.image = nil
    }
    
    func configure(tweet: Tweet) {
        dateLabel.text = tweet.date // 4. 投稿日時
        bodyLabel.text = tweet.text // 5. ツイート本文
        
        guard let user = tweet.user else { return }
        nameLabel.text = user.name // 2. ユーザ名
        screenNameLabel.text = "@" + user.screen_name // 3. スクリーンネーム
        
        // ユーザ画像の取得リクエスト
        let request = URLRequest(url: URL(string: user.profile_image_url_https)!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 20)
        let task = URLSession.shared.dataTask(with: request) { [weak self] (responseData, response, error) in
            guard let responseData = responseData else { return }
            guard let image = UIImage(data: responseData) else { return }
            
            // ここは非同期のスレッドなのでメインスレッドでUIを更新する。
            DispatchQueue.main.async {
                self?.userImageView.image = image // 1. ユーザ画像
            }
        }
        task.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
