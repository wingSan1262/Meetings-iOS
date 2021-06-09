//
//  AdditionViewController.swift
//  MeetingTimerNote
//
//  Created by user on 07/06/21.
//

import UIKit

class AdditionViewController: UIViewController {

    // UI Components
    @IBOutlet weak var reserverName: UITextField!
    @IBOutlet weak var pickerRoom: UIPickerView!
    @IBOutlet weak var meetingName: UITextField!
    @IBOutlet weak var dateDetails: UITextField!
    @IBOutlet weak var minutes: UITextField!
    @IBOutlet weak var seconds: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var meetingDetails: UITextView!
    
    var meetingRoom : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickerRoom.dataSource = self
        pickerRoom.delegate = self
        
    }

    @IBAction func addMeetingItem(_ sender: Any, forEvent event: UIEvent) {
        // TODO -9999999 only temporary value to indicate user didnot enter correct time
        if (((Int(self.minutes.text!) ?? -99999999) == -99999999) || ((Int(self.seconds.text!) ?? -99999999) == -99999999)) {
            let alert = UIAlertController(
                    title: "Wrong time input format",
                    message: "Please input only in number and without space, please put zero if not needed.",
                    preferredStyle: .alert
                )
             
                alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                    // do nothing dialog
                })
             
                self.present(alert, animated: true)
        } else {
            let meetingItem =  MeetingInformation (room: meetingRoom!, meetingName: self.meetingName.text!, reserverName: self.reserverName.text!, date: self.dateDetails.text!, details: self.meetingDetails.text!, minutes: Int(self.minutes.text!) ?? 0, seconds: Int(self.seconds.text!) ?? 0)
            
            meetingsLists.append(meetingItem)
            
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}

extension AdditionViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        meetingRoom = availableRooms[row]
        return availableRooms[row]
    }
    
}

extension AdditionViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return availableRooms.count
    }
    
    
    
}
