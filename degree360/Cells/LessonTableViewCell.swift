//
//  LessonTableViewCell.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class LessonTableViewCell: UITableViewCell {

    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var topicsCount: UILabel! // "There are 5 topics"
    @IBOutlet weak var myLessonScore: UIProgressView!
    @IBOutlet weak var bgView : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.hero.isEnabled = true
        bgView.layer.cornerRadius = 10
        
        // shadow
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOffset = CGSize(width: 3, height: 3)
        bgView.layer.shadowOpacity = 0.7
        bgView.layer.shadowRadius = 4.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
