//
//  MeetingBaseList.swift
//  MeetingTimerNote
//
//  Created by user on 07/06/21.
//

import Foundation

var meetingsLists : [MeetingInformation] = [
    
    MeetingInformation (room: availableRooms[0], meetingName: "code review", reserverName: "wing", date: "3 juni 2021 15:00", details: "Code review for Epson iPrint 770 intent share for 3rd app user, japan post card etc", minutes: 0, seconds: 15),
    MeetingInformation (room: availableRooms[1], meetingName: "spec judgement", reserverName: "merry", date: "21 juni 2021 15:00", details: "SEC-EPSON IEI spec discussion for dialog string smart panel" , minutes: 20, seconds: 15),
    MeetingInformation (room: availableRooms[2], meetingName: "Farewell Merry", reserverName: "Ivan", date: "4 juni 2021 15:00", details: "Farewell IEI epson appli design leader T_T", minutes: 20, seconds: 15)
]
