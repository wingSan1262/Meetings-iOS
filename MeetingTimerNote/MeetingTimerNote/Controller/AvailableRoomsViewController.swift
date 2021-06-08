//
//  AvailableRoomsViewController.swift
//  MeetingTimerNote
//
//  Created by user on 08/06/21.
//

import UIKit

class AvailableRoomsViewController: UIViewController {

    @IBOutlet weak var availableRoomsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        availableRoomsTable.dataSource = self
        availableRoomsTable.register(UINib(nibName: "AvailableRoomsTableViewCell", bundle: nil), forCellReuseIdentifier: "AvailableRoomCell")
        
        // Do any additional setup after loading the view.
    }
    
}

extension AvailableRoomsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        availableRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AvailableRoomCell", for: indexPath) as? AvailableRoomsTableViewCell{
            
            cell.meetingRoomName.text = availableRooms[indexPath.row]
            cell.roomCapacity.text = "6"
            if(availableRooms[indexPath.row] == bigMeetingRoom) {
                cell.roomCapacity.text = "12"
            }
            return cell
        } else {
            
            return UITableViewCell()
            
        }
        
    }
    
    
}
