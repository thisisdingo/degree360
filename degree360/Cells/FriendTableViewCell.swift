//
//  FriendTableViewCell.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didStarBtnTapped(_ sender : UIButton){
        setStar(sender.tag)
    }
    
    func setStar(_ value : Int){
        
        switch value {
        case 0:
            star1.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star2.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star3.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star4.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star5.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            break
        case 1:
            star1.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star2.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star3.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star4.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star5.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            break
        case 2:
            star1.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star2.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star3.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star4.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star5.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            break
        case 3:
            star1.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star2.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star3.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star4.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star5.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            break
        case 4:
            star1.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star2.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star3.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star4.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star5.setImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            break
        case 5:
            star1.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star2.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star3.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star4.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star5.setImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            break
        default:
            break
        }
        
    }
    
}
