//
//  ContentView.swift
//  Animation
//
//  Created by T Krobot on 16/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var lineLength = 0.0
    @State var started = false
    
    var body: some View {
        if(started){
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                for _ in 1 ... 1500 {
                    let x = Int.random(in: 0...400)
                    let y = Int.random(in: 0...750)
                    withAnimation{
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
                    path.closeSubpath()
            }
            .trim(from: lineLength * 2 - 1 , to: lineLength)
            .stroke(.blue, lineWidth: 3)
            .task {
                lineLength = 1
            }
            .animation(Animation.easeInOut(duration: 60))
        }
        else{
            Button{
                started = true
            } label: {
                Text("Start")
                    .frame(width: 300, height: 150)
                    .font(.largeTitle)
                    .background(.blue)
                    .foregroundColor(.white)
                    .border(.black, width: 3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
