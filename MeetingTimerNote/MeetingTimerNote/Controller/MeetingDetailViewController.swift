//
//  MeetingDetailViewController.swift
//  MeetingTimerNote
//
//  Created by user on 07/06/21.
//

import UIKit

class MeetingDetailViewController: UIViewController {
    
    @IBOutlet weak var meetingName: UILabel!
    @IBOutlet weak var reserverName: UILabel!
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var meetingDetails: UILabel!
    @IBOutlet weak var dateInformation: UILabel!
    @IBOutlet weak var startMeetingButton: UIButton!
    @IBOutlet weak var timeCounter: UILabel!
    var mMeeting : MeetingInformation?
    var index : Int?
    
    var seconds : Int?
    var minutes : Int?
    
    @IBOutlet var viewContainer: UIView!
    var isTimerRunning = false
    
    var mTimer = Timer()
    
    var callbackAction: Action?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        meetingName.text = mMeeting?.meetingName
        
        reserverName.text = mMeeting?.reserverName
        
        roomName.text = mMeeting?.room
        
        dateInformation.text = mMeeting?.date
        
        meetingDetails.text = mMeeting?.details
        
        seconds = mMeeting!.seconds
        minutes = mMeeting!.minutes
        
        let minutesInString = String(mMeeting?.minutes ?? 00)
        
        let secondsInString = String (mMeeting?.seconds ?? 00)
        
        timeCounter.text = minutesInString + ":" + secondsInString

        // Do any additional setup after loading the view.
    }
    func runTimer() {
         mTimer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        isTimerRunning = true
        if (seconds! <= 0 && minutes! > 0) {
            seconds! = 59
            minutes! = minutes! - 1
        } else if (seconds! > 0){
            seconds = seconds! - 1
        } else {
            // TODO do something if timer is done
            isTimerRunning = false
            endMeeting()
        }
        
        var minutesInString : String
        var secondsInString : String
        
        if (minutes! > 9){
             minutesInString = String(minutes!)
        } else {
             minutesInString = "0" + String(minutes!)
        }
        
        if (seconds! > 9){
             secondsInString = String (seconds!)
        } else {
             secondsInString = "0" + String (seconds!)
        }
        
        
        timeCounter.text = minutesInString + ":" + secondsInString
    
    }
    
    func endMeeting (){
        mTimer.invalidate()
        
        viewContainer.backgroundColor = UIColor (red: 75/255, green: 26/255, blue: 31/255, alpha: 1)
        
        let alert = UIAlertController(
                title: "Time is up",
                message: "Your meeting session is up",
                preferredStyle: .alert
            )
         
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                meetingsLists.remove(at: self.index!)
                self.dismiss(animated: true) {
                    self.callbackAction?()
                }
            })
         
            self.present(alert, animated: true)
    }
    
    @IBAction func startOrStopButtonPressed(_ sender: Any) {
        if (isTimerRunning == false) {
            runTimer()
            startMeetingButton.setTitle("Stop", for: .normal)
        } else {
            mTimer.invalidate()
            startMeetingButton.setTitle("Start", for: .normal)
            isTimerRunning = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
