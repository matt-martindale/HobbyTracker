//
//  FriendTableViewCell.swift
//  HobbyTracker
//
//  Created by Matthew Martindale on 2/5/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeTownLabel: UILabel!
    @IBOutlet weak var hobbyCountLabel: UILabel!
    
    var friend: Friend? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        nameLabel.text = friend.name
        homeTownLabel.text = friend.hometown
        hobbyCountLabel.text = "\(friend.hobbies.count) hobbies"
    }

}
