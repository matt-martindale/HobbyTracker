//
//  AddFriendViewController.swift
//  HobbyTracker
//
//  Created by Matthew Martindale on 2/5/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

protocol AddFriendDelegate {
    func friendWasCreated(_ friend: Friend)
}

//Delegator!!
//1: Create a protocol with the delgate name
//2: Create a delegate property of type [whatever delegate is]
//3: When needed, call the delegate method on the delegator


//responsible for creating a friend object
class AddFriendViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var homeTownTextField: UITextField!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    
    var delegate: AddFriendDelegate?
    
    
    //MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
        let hometown = homeTownTextField.text,
        !name.isEmpty,
        !hometown.isEmpty else { return }
        
        var friend = Friend(name: name, hometown: hometown, hobbies: [])
        
        if let hobby1 = hobby1TextField.text,
            !hobby1.isEmpty {
            friend.hobbies.append(hobby1)
        }
        
        if let hobby2 = hobby2TextField.text,
            !hobby2.isEmpty {
            friend.hobbies.append(hobby2)
        }
        
        if let hobby3 = hobby3TextField.text,
            !hobby3.isEmpty {
            friend.hobbies.append(hobby3)
        }
        
        delegate?.friendWasCreated(friend)
        self.dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
