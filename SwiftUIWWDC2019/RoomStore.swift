//
//  RoomStore.swift
//  SwiftUIWWDC2019
//
//  Created by Vladislav Dorfman on 17/10/2020.
//

import Combine
import SwiftUI

class RoomStore : ObservableObject {
    @Published var rooms: [Room]
//    {
//        didSet {
//            didChange.send()
//        }
//    }
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
    
//    @Published var didChange = PassthroughSubject<Void, Never>()
}
