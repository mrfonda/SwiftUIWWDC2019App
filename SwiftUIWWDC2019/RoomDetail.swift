//
//  RoomDetail.swift
//  SwiftUIWWDC2019
//
//  Created by Yoav Dror on 16/10/2020.
//

import SwiftUI

struct RoomDetail: View {
    let room: Room
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode: .inline)
                .onTapGesture(perform: {
                    withAnimation { self.zoomed.toggle() }
                })
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            if room.hasVideo && !zoomed {
                Image(systemName: "video.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.all)
                    .transition(.move(edge: .leading))
            }
        })
    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                RoomDetail(room: testData[0])
            }
            NavigationView {
                RoomDetail(room: testData[1])
            }
            NavigationView {
                RoomDetail(room: testData[2])
            }
        }
    }
}
