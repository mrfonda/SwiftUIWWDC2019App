//
//  SwiftUIWWDC2019App.swift
//  SwiftUIWWDC2019
//
//  Created by Yoav Dror on 16/10/2020.
//

import SwiftUI

@main
struct SwiftUIWWDC2019App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: RoomStore(rooms: testData))
        }
    }
}
