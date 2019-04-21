//
//  FriendTableViewCell.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

protocol FriendTableViewCellProtocol : class {
    func setRateFor(_ index : Int, _ rate : Int)
}

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var answerLabel: UILabel!
    var index : Int = 0
    
    weak var delegate : FriendTableViewCellProtocol?
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didStarBtnTapped(_ sender : UIButton){
        delegate?.setRateFor(index, sender.tag)

        setStar(sender.tag)
    }
    
    func setStar(_ value : Int){
        switch value {
        case 0:
            star1.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star2.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star3.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star4.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star5.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            break
        case 1:
            star1.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star2.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star3.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star4.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star5.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            break
        case 2:
            star1.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star2.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star3.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star4.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star5.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            break
        case 3:
            star1.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star2.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star3.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star4.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            star5.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            break
        case 4:
            star1.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star2.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star3.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star4.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star5.setBackgroundImage(#imageLiteral(resourceName: "star_unselected"), for: .normal)
            break
        case 5:
            star1.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star2.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star3.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star4.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            star5.setBackgroundImage(#imageLiteral(resourceName: "star_selected"), for: .normal)
            break
        default:
            break
        }
        
    }
    
}
