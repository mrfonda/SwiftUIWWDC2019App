//
//  ContentView.swift
//  SwiftUIWWDC2019
//
//  Created by Yoav Dror on 16/10/2020.
//

import SwiftUI
import Combine
import UIKit

struct ContentView: View {
    @ObservedObject var store: RoomStore
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                        Text("Add Room")
                    }
                }
                Section {
                    ForEach(store.rooms) { room in
                        
                        RoomCell(room: room)
                    }
                    .onDelete(perform: deleteRoom)
                    .onMove(perform: move)
                }
            }
            .navigationBarTitle(Text("Rooms"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
    
    func addRoom() {
        withAnimation {
            store.rooms.append(Room(name: "New Room",
                                    capacity: 2,
                                    hasVideo: false))
        }
    }
    
    func deleteRoom(at offsets: IndexSet) {
        store.rooms.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let testStore = RoomStore(rooms: testData)
        Group {
            ContentView(store: testStore)
            
            ContentView(store: testStore)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            
            ContentView(store: testStore)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .environment(\.colorScheme, .dark)
            
            ContentView(store: testStore)
                .environment(\.layoutDirection, .rightToLeft)
        }
    }
}

struct RoomCell: View {
    let room: Room
    
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            let image = UIImage(named: room.imageName) ?? UIImage()
            HStack(alignment: .center) {
                
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(0.0)
                    .frame(width: 40.0, height: 40.0)
                    .cornerRadius(5.0)
                
                VStack(alignment: .leading) {
                    Text(room.name)
                    Text("\(room.capacity) people")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
