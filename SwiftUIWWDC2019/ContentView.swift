//
//  ContentView.swift
//  SwiftUIWWDC2019
//
//  Created by Yoav Dror on 16/10/2020.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var rooms: [Room] = []
    
    
    var body: some View {
        NavigationView {
            List(rooms) { room in
                
                
                RoomCell(room: room)
            }
            .navigationBarTitle(Text("Rooms"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rooms: testData)
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
                    .padding(5.0)
                    .frame(width: 40.0, height: 40.0)
                    .cornerRadius(9.0)
                
                
                
                
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
