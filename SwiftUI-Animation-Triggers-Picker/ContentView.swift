//
//  ContentView.swift
//  SwiftUI-Animation-Triggers-Picker
//
//  Created by ekayaint on 9.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var segment = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("Triggers").font(.largeTitle)
            Text("Picker").font(.title).foregroundColor(.gray)
            
            Picker("", selection: $segment) {
                Text("Gündüz ☀️").tag(0)
                Text("Gece 🌙").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
            
            GeometryReader { gr in
                ZStack {
                    VStack(spacing: 20) {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "sun.max.fill").font(.system(size: 50))
                            Spacer()
                        }.padding(.top, 25)
                        Text("Day").fontWeight(.bold)
                        Spacer()
                    }.background(Image("sunSea").resizable().aspectRatio(contentMode: .fit))
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .offset(x: self.segment == 0 ? 0 : -gr.size.width, y: 0)
                        .animation(.default, value: segment)
                    
                    VStack(spacing: 20) {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "moon.fill").font(.system(size: 50))
                            Spacer()
                        }.padding(.top, 25)
                        Text("Night").fontWeight(.bold)
                        Spacer()
                    }.background(Image("nightMoon").resizable().aspectRatio(contentMode: .fit))
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .offset(x: self.segment == 1 ? 0 : gr.size.width, y: 0)
                        .animation(.default, value: segment)
                }.shadow(radius: 15)
                    .padding(.horizontal)
            }
            
        } // VSTACK
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
