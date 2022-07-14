//
//  PostTableViewCell.swift
//  RedditObjC
//
//  Created by Tatiana Bondarenko on 7/14/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upvoteCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let post = post else { return }
        
        titleLabel.text = post.title
        upvoteCountLabel.text = "\(post.upvoteCount) 👍"
        commentCountLabel.text = "\(post.commentCount) 💬"
    }
}

