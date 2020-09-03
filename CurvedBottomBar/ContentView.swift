//
//  ContentView.swift
//  CurvedBottomBar
//
//  Created by 野澤拓己 on 2020/09/03.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    
    var body: some View {
        
        VStack {
            
            // Your View.....
            Spacer()
            
            ZStack(alignment: .top) {
                
                BottomBar(selected: self.$selected)
                    .padding()
                    .padding(.horizontal, 22)
                    .background(CurvedShape())
                
                Button(action: {
                    
                }) {
                    
                    Image("Wishlist").renderingMode(.original).padding(18)
                }.background(Color.yellow)
                .clipShape(Circle())
                .offset(y: -35)
                .shadow(radius: 5)
                
            }
            
 
        }.background(Color("Color").edgesIgnoringSafeArea(.top))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CurvedShape: View {
    
    var body: some View {
        
        Path { path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 55))
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width/2, y: 55), radius: 30, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            
            path.addLine(to: CGPoint(x: 0, y: 55))
            
        }.fill(Color.white)
            .rotationEffect(.init(degrees: 180))
    
    }
}

struct BottomBar: View {
    
    @Binding var selected: Int
    
    var body: some View {
        
        HStack {
            
            Button(action: {
                
                self.selected = 0
                
            }) {
                
                Image("home")
                
            }.foregroundColor(self.selected == 0 ? .black : .gray)
                .offset(x: -10)
            
            Spacer(minLength: 12)
            
            Button(action: {
                
                self.selected = 1
                
            }) {
                
                Image("search")
                
            }.foregroundColor(self.selected == 1 ? .black : .gray)
            
            Spacer().frame(width: 120)
            
            Button(action: {
                
                self.selected = 2
                
            }) {
                
                Image("person")
                
            }.foregroundColor(self.selected == 2 ? .black : .gray)

            
            Spacer(minLength: 12)
            
            Button(action: {
                
                self.selected = 3
                
            }) {
                
                Image("menu")
                
            }.foregroundColor(self.selected == 3 ? .black : .gray)

            
            
        }
    }
}
