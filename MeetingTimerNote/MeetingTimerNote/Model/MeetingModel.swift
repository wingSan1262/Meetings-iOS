//
//  MeetingModel.swift
//  MeetingTimerNote
//
//  Created by user on 07/06/21.
//

import UIKit


let roomOne = "Room One"
let bigMeetingRoom = "Big MR"
let meetingTable = "Meeting Table"
let roomThree = "Room Three"
let isolationRoom = "Isolation MR"
let evaluationRoom = "Eval MR"

//var roomDictionary:[Int:String] = [roomOne:"Room One", bigMeetingRoom:"Big MR", meetingTable:"Meeting Table"]

var availableRooms:[String] = [
    roomOne, bigMeetingRoom, meetingTable
]

struct MeetingInformation {
    let room : String
    let meetingName : String
    let reserverName : String
    let date : String
    let details : String
    let minutes : Int
    let seconds : Int
}

