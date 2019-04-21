//
//  TopicVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

struct TopicRate {
    var topicId : String
    var rate : Int
}


class LessonSignleVC : UIViewController, LessonSignleVCInteractorProtocol {

    @IBOutlet weak var usersCollectionView : UICollectionView!
    @IBOutlet weak var topicsTableView : UITableView!
    
    @IBOutlet weak var lessonId : UILabel!
    @IBOutlet weak var lessonTitle : UILabel!
    
    
    var lesson : Lesson!
    var selectedUserIndex = 0
    var usersRates = [String : [String : Int]]()
    
    var interactor : LessonSignleVCInteractor!
    
    func showFriends() {
        
    }
    
    func showFriendTopics(_ topics: [Topic]) {
        
    }
    
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
        
        // init answers
        lesson.friends.forEach({ friend in
            usersRates[friend.id] = [String : Int]()
            lesson.topics.forEach({ topic in
                usersRates[friend.id]![topic.id] = 0
            })
        })
        
        interactor = LessonSignleVCInteractor(self)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(self.addSaveTapped(_:)))
        
        
        lessonId.text = "Your lesson id: " + lesson.id
        lessonTitle.text = "Lesson name: " + lesson.title
    }
    
    @objc func addSaveTapped(_ sender : Any) {
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedUserIndex = indexPath.row
        self.topicsTableView.reloadData()
    }
}

extension LessonSignleVC : UITableViewDelegate, UITableViewDataSource, FriendTableViewCellProtocol {
    func setRateFor(_ index: Int, _ rate: Int) {
        let userId = lesson.friends[selectedUserIndex].id
        let topicId = lesson.topics[index].id
        
        usersRates[userId]?[topicId] = rate
        
        self.interactor.setRaiting(userId, topicId, rate)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lesson.topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as! FriendTableViewCell
        let userId = lesson.friends[selectedUserIndex].id
        let topic = lesson.topics[indexPath.row]
        
        cell.index = indexPath.row
        cell.answerLabel.text = topic.title
        cell.delegate = self
        
        if let star = usersRates[userId]?[topic.id] {
            cell.setStar(star)
        }
        
        return cell
    }
    
    
    
}
