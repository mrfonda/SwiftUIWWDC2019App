//
//  Room.swift
//  SwiftUIWWDC2019
//
//  Created by Yoav Dror on 16/10/2020.
//

import SwiftUI
struct Room : Identifiable {
    var id = UUID()
    var name: String
    var capacity: Int
    var hasVideo: Bool = false
    var imageName: String { return name }
    var thubnailName: String { return name + "Thumb" }
}

#if DEBUG
let testData = [
    Room(name: "Room 1", capacity: 5, hasVideo: true),
    Room(name: "Room 2", capacity: 15, hasVideo: false),
    Room(name: "Room 3", capacity: 20, hasVideo: true),
    Room(name: "Room 4", capacity: 2, hasVideo: false),
    Room(name: "Room 5", capacity: 12, hasVideo: true),
    Room(name: "Room 6", capacity: 8, hasVideo: false),
    Room(name: "Room 7", capacity: 4, hasVideo: true),
    Room(name: "Room 8", capacity: 14, hasVideo: true)
]
#endif
