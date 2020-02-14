//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Matthew Martindale on 1/30/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController, UITableViewDelegate {

    
    
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    
    
}

extension FriendsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as?
            FriendTableViewCell else { return UITableViewCell() }
        
        let friend = friends[indexPath.row]
        cell.friend = friend
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddFriendSegue" {
            let addFriendVC = segue.destination as!
            AddFriendViewController
            
            addFriendVC.delegate = self
        }
    }
    
}



extension FriendsTableViewController: AddFriendDelegate {
    func friendWasCreated(_ friend: Friend) {
        friends.append(friend)
        tableView.reloadData()
    }
}


