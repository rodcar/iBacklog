//
//  UserstoryTableViewCell.swift
//  iBacklog
//
//  Created by user155748 on 7/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import UIKit

class UserstoryTableViewCell: UITableViewCell {

    @IBOutlet weak var userstoryDescriptionLabel: UILabel!
    @IBOutlet weak var userstoryStorypointsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUserStory(withDescription description: String, withStorypoints storypoints: Int) {
        self.userstoryDescriptionLabel.text = description
        self.userstoryStorypointsLabel.text = String(storypoints)
    }

}
