//
//  CustomCell.swift
//  TestCenterView
//
//  Created by truongtvd on 8/22/17.
//  Copyright © 2017 truongtvd. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var videoView: UIView!
    
    
    
    func notifyCompletelyVisible()  {
        videoView.backgroundColor = UIColor.red
        print("notifyCompletelyVisible")

    }
    func notifyNotCompletelyVisible()  {
        videoView.backgroundColor = UIColor.lightGray
        print("notifyNotCompletelyVisible")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        videoView.backgroundColor = UIColor.lightGray

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
