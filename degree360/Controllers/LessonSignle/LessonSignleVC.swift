//
//  TopicVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit
import Hero

struct TopicRate {
    var topicId : String
    var rate : Int
}


class LessonSignleVC : UIViewController, LessonSignleVCInteractorProtocol {
    func didJoined(_ lesson : Lesson) {
        self.lesson = lesson
        setContent()
    }
    

    @IBOutlet weak var usersCollectionView : UICollectionView!
    @IBOutlet weak var topicsTableView : UITableView!
    
    @IBOutlet weak var lessonId : UILabel!
    @IBOutlet weak var lessonTitle : UILabel!
    @IBOutlet weak var currentUser : UILabel!
    @IBOutlet weak var closeBtn : UIButton!

    
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
        
        self.hero.modalAnimationType = .selectBy(presenting:.zoom, dismissing:.zoomOut)

        self.hero.isEnabled = true
        
        usersCollectionView.register(UINib.init(nibName: "FriendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FriendCollectionViewCell")
        usersCollectionView.dataSource = self
        usersCollectionView.delegate = self
        
        usersCollectionView.hero.modifiers = [.cascade]
        for cell in usersCollectionView.visibleCells {
            cell.hero.modifiers = [.fade, .scale(0.5)]
        }
        
        topicsTableView.register(UINib.init(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendTableViewCell")
        topicsTableView.dataSource = self
        topicsTableView.delegate = self
        
        // init answers
        
        currentUser.font = UIFont.boldSystemFont(ofSize: 16.0)
        interactor = LessonSignleVCInteractor(self)
        setContent()
        
        closeBtn.layer.cornerRadius = 20
        
        // shadow
        closeBtn.layer.shadowColor = UIColor.black.cgColor
        closeBtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        closeBtn.layer.shadowOpacity = 0.7
        closeBtn.layer.shadowRadius = 10
        
    }
    
    func setContent(){
        
        lesson.friends.forEach({ friend in
            usersRates[friend.id] = [String : Int]()
            lesson.topics.forEach({ topic in
                
                if let rate = topic.rates.first(where: { $0.userId == friend.id }) {
                    usersRates[friend.id]![topic.id] = rate.value
                }else{
                    usersRates[friend.id]![topic.id] = 0
                }
            })
        })
        
        self.currentUser.text = lesson.friends[selectedUserIndex].name
        lessonId.text = lesson.title + " / " + lesson.id //"Your lesson id: " + lesson.id
        lessonTitle.text = "There are " + String(lesson.friends.count) + " persons"
        
        if !lesson.friends.contains(where: { $0.id == UserController.shared.userId }) {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Join", style: .done, target: self, action: #selector(self.didJoinButtonTapped(_:)))
        }else{
            self.navigationItem.rightBarButtonItem = nil
        }
        
        topicsTableView.reloadData()
        usersCollectionView.reloadData()

    }
    
    @objc func didJoinButtonTapped(_ sender : Any) {
        interactor.joinTapped(self.lesson.id)
    }
    
    
    @objc func closeBtn(_ sender : UIButton){
        self.dismiss(animated: true, completion: nil)
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
        if(selectedUserIndex == indexPath.row){
            cell.friendName.font = UIFont.boldSystemFont(ofSize: 16.0)
        }else{
            cell.friendName.font = UIFont.systemFont(ofSize: 16.0)
        }
        if(friend.avatar != ""){
            cell.friendPhoto.setImage(Constants.serverAddress + friend.avatar )
        }else{
            cell.friendPhoto.image = UIImage(named: "male")
        }

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
        self.currentUser.text = lesson.friends[selectedUserIndex].name
        self.topicsTableView.reloadData()
        
        self.usersCollectionView.reloadItems(at: [indexPath])
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
