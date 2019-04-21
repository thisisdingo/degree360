//
//  LessonVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit
import Hero
import JJHUD

class LessonVC : UIViewController, LessonInteractorProtocol {

    @IBOutlet weak var tableView: UITableView!

    var interactor : LessonInteractor!
    var lessons = [Lesson]()
    
    func showNoLessons() {
        
    }
    
    func showLessons(_ lessons: [Lesson]) {
        self.lessons = lessons
        self.tableView.reloadData()
    }
    
    func showMessage(_ message: String) {
        alert(message)
    }
    
    func startLoading() {
        JJHUD.showLoading()
    }
    
    func hideLoading() {
        JJHUD.hide()
    }
    
    func didJoinRoom() {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        self.interactor = LessonInteractor(self)
        self.hero.isEnabled = true
        initViews()
        self.hero.modalAnimationType = .selectBy(presenting:.zoom, dismissing:.zoomOut)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor.getLessons()
    }
    
    static func getVC() -> LessonVC{
        return LessonVC.init(nibName: "LessonVC", bundle: nil)
    }
    
    func initViews(){

        let joinBtn = UIBarButtonItem(title: "Action", style: .done, target: self, action: #selector(self.joinButtonTapped(_:)))
        self.navigationItem.leftBarButtonItem = joinBtn
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib.init(nibName: "LessonTableViewCell", bundle: nil), forCellReuseIdentifier: "LessonTableViewCell")
    }
    
    @objc func addButtonTapped(){
        self.navigationController?.pushViewController(LessonCreateVC.getVC(), animated: true)
    }
    
    @objc func joinButtonTapped(_ sender : UIBarButtonItem){
        let alert = UIAlertController(title: "Choose variant", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Join", style: .default, handler: { [weak self] _ in
            self?.join()
        }))
        alert.addAction(UIAlertAction(title: "Create new room", style: .default, handler: { [weak self] _ in
            self?.addButtonTapped()
        }))
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { [weak self] _ in
            UserController.shared.dropUserData()
            self?.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    func join(){
        let alert = UIAlertController(title: "Join lesson", message: "Please, enter your lesson ID", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Room id"
            textField.keyboardType = .decimalPad
        })
        alert.addAction(UIAlertAction(title: "Join", style: .default, handler: { [weak self] _ in
            guard let roomID = alert.textFields!.first?.text else {
                return
            }
            
            self?.interactor.joinRoom(roomID)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension LessonVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonTableViewCell") as! LessonTableViewCell
        let lesson = lessons[indexPath.row]
        
        cell.lessonName.text = lesson.title
        cell.topicsCount.text = "There are \(lesson.topics.count) topics"
        let progress = Progress(totalUnitCount: 100)
        progress.completedUnitCount = Int64(Int.random(in: 0..<100))
        progress.completedUnitCount += 1
        cell.myLessonScore.setProgress(Float(progress.fractionCompleted), animated: true)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = LessonSignleVC.getVC()
        vc.lesson = lessons[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
