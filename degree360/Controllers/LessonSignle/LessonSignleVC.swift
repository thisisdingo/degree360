//
//  TopicVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class LessonSignleVC : UIViewController, LessonSignleVCInteractorProtocol {
    
    
    @IBOutlet weak var usersCollectionView : UICollectionView!
    @IBOutlet weak var topicsTableView : UITableView!
    
    var lesson : Lesson!
    
    func showFriendTopics() {
    
    }
    
    func successRatingSet() {
    
    }
    
    func successRatingUpdate() {
    
    }
    
    func showMessage(_ message: String) {
    
    }
    
    func startLoading() {
    
    }
    
    func hideLoading() {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersCollectionView.register(UINib.init(nibName: "FriendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FriendCollectionViewCell")
        usersCollectionView.dataSource = self
        usersCollectionView.delegate = self
        usersCollectionView.reloadData()
        
        topicsTableView.register(UINib.init(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendTableViewCell")
        topicsTableView.dataSource = self
        topicsTableView.delegate = self
        topicsTableView.reloadData()
    }
    
    
    static func getVC() -> LessonSignleVC{
        return LessonSignleVC.init(nibName: "LessonSignleVC", bundle: nil)
    }
    
}

extension LessonSignleVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCollectionViewCell", for: indexPath) as! FriendCollectionViewCell
        let friend = lesson.friends[indexPath.row]
        
        cell.friendName.text = friend.name
        cell.friendPhoto.setImage(Constants.serverAddress + friend.avatar)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lesson.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
}

extension LessonSignleVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lesson.topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as! FriendTableViewCell
        
        cell.answerLabel.text = lesson.topics[indexPath.row].title
        
        return cell
    }
    
    
    
}
