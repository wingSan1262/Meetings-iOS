//
//  MeetingTableViewCell.swift
//  MeetingTimerNote
//
//  Created by user on 07/06/21.
//

import UIKit

class MeetingTableViewCell: UITableViewCell {

    @IBOutlet weak var logoMeeting: UILabel!
    @IBOutlet weak var picName: UILabel!
    @IBOutlet weak var meetingName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
