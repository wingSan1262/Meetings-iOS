//
//  AvailableRoomsTableViewCell.swift
//  MeetingTimerNote
//
//  Created by user on 08/06/21.
//

import UIKit

class AvailableRoomsTableViewCell: UITableViewCell {

    @IBOutlet weak var roomCapacity: UILabel!
    @IBOutlet weak var meetingRoomName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
