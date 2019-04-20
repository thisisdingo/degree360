//
//  LessonCreateVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class LessonCreateVC : UIViewController, LessonCreateInteractorProtocol {
    
    static func getVC() -> LessonCreateVC{
        return LessonCreateVC.init(nibName: "LessonCreateVC", bundle: nil)
    }
    
    
    @IBOutlet weak var lessonTitle: UITextField!
    @IBOutlet weak var lessonDescription: UITextField!
    @IBOutlet weak var newTopicTextFiedld: UITextField!
    @IBOutlet weak var tableViewheightContraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!

    var topics = [String]()
    var interactor : LessonCreateInteractor!
    
    override func viewDidLoad() {
        self.interactor = LessonCreateInteractor(self)
        
        initViews()
    }
    
    
    func initViews(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func successCreate(_ lesson: Lesson) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func showMessage(_ message: String) {
        alert(message)
    }
    
    func startLoading() {
        
    }
    
    func hideLoading() {
        
    }
    


    
    
    
    @IBAction func createBtn(_ sender: UIButton) {
        interactor.createLesson(lessonTitle.text!, lessonDescription.text!, topics)
    }
    
    @IBAction func didCreateTopicBtnTapped(_ sender: Any) {
        let topicName = newTopicTextFiedld.text!
        newTopicTextFiedld.text = nil
        
        self.topics.append(topicName)
        self.tableView.reloadData()
        setTableViewHeight()
    }
    
    func removeWord(_ index : Int){
        self.topics.remove(at: index)
        self.tableView.reloadData()
        setTableViewHeight()
    }
    
    func setTableViewHeight(){
        self.tableViewheightContraint.constant = CGFloat(self.topics.count * 44)
        UIView.animate(withDuration: 0.3, animations: {
            self.loadViewIfNeeded()
        })
    }
    
}

extension LessonCreateVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = topics[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete", handler: { [weak self] _, indexPath in
            self?.removeWord(indexPath.row)
        })
        return [deleteAction]
    }
    
    
    
    
}
