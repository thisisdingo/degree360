//
//  LessonVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class LessonVC : UIViewController, LessonInteractorProtocol {
    
    var interactor : LessonInteractor!
    @IBOutlet weak var tableView: UITableView!
    
    var lessons = [Lesson]()
    
    func showLessons(_ lessons: [Lesson]) {
        self.lessons = lessons
        self.tableView.reloadData()
    }
    
    func showMessage(_ message: String) {
        
    }
    
    func startLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    override func viewDidLoad() {
        self.interactor = LessonInteractor(self)
        initViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor.getLessons()
    }
    
    static func getVC() -> LessonVC{
        return LessonVC.init(nibName: "LessonVC", bundle: nil)
    }
    
    func initViews(){
        let createBtn = UIBarButtonItem(title: "NEW", style: .done, target: self, action: #selector(self.addButtonTapped(_:)))
        self.navigationItem.rightBarButtonItem = createBtn
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib.init(nibName: "LessonTableViewCell", bundle: nil), forCellReuseIdentifier: "LessonTableViewCell")
    }
    
    @objc func addButtonTapped(_ sender : UIBarButtonItem){
        self.navigationController?.pushViewController(LessonCreateVC.getVC(), animated: true)
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
        cell.myLessonScore.progress = Float(1/100 * Int.random(in: 1 ..< 100))
        
        return cell
    }
}
