//
//  ViewController.swift
//  MeetingTimerNote
//
//  Created by user on 07/06/21.
//

import UIKit

typealias Action = () -> () // replace AnyObject to what you need
class ViewController: UIViewController {
    
    // i just do a MF callback !!!! hehe
    // TODO remain addition
    func modalAction() -> Action {
        myTableView.reloadData()
        return {
            self.myTableView.reloadData()
          // the x is what you want to passed by the modal viewcontroller
          // now you got it
        }
      }

    @IBOutlet weak var mEditButton: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    
    var isFromOtherView = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UINib(nibName: "MeetingTableViewCell", bundle: nil), forCellReuseIdentifier: "MeetingCell")
    }
    
    
    @IBAction func addAction(_ sender: Any, forEvent event: UIEvent) {
        let detail = AdditionViewController(nibName: "AdditionViewController", bundle: nil)
        
        // Push/mendorong view controller lain
        self.navigationController?.pushViewController(detail, animated: true)
        
        self.isFromOtherView = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (self.isFromOtherView == true) {
            self.isFromOtherView = false
            self.myTableView.reloadData()
        }
    }
    
    
    func updateTable() {
        myTableView.reloadData()
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetingsLists.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MeetingCell", for: indexPath) as? MeetingTableViewCell{
            
            let myMeeting =  meetingsLists[indexPath.row]
            cell.logoMeeting.text = myMeeting.room
            cell.meetingName.text = myMeeting.meetingName
            cell.picName.text = myMeeting.reserverName
            cell.timeLabel.text = myMeeting.date
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // respond method
        objectTapped(row: indexPath.row)
    }
    
    @objc func objectTapped(row : Int) {
            // Digunakan menginisialisasi DetailViewController
        
        /**
         "Main" -> StoryBoard Name
         bundle = nil no passed data ?? not sure
         with identifier -> check the called scene root view identifier
         as -> follow with the scene view controller
         */
        guard let controller = UIStoryboard(
                    name: "Main",
                    bundle: nil
            ).instantiateViewController(
                withIdentifier: "MeetingDetailViewControllerScene"
            ) as? MeetingDetailViewController else { return }
            // Kode dibawah digunakan untuk berpindah ke halaman detail dengan membawa informasi yang sesuai
        controller.mMeeting = meetingsLists[row]
        controller.index = row
        
        controller.callbackAction = modalAction()
        self.present(controller, animated: true) {
            // TODO i dont know forgot to revert this
        }
    }
}

