//
//  ContentView.swift
//  LightBulbObservableObject
//
//  Created by Stefania Zinno for the Developer Academy on 12/10/21.
//
//


import SwiftUI

struct ContentView: View {
    @StateObject var lightBulb = LightBulb(color: .yellow, intensity: 1)
    @State private var showModal = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                HStack{
                    lightBulb.light
                        .foregroundColor(.yellow)
                        .font(.system(size: 60))
                        .opacity(lightBulb.intensity)
                        .padding()
                }
                Group{
                    Button("On/Off") {
                        lightBulb.intensity = lightBulb.intensity == 1 ? 0 : 1
                    }
                    Button("Dim") {
                       showModal.toggle()
                    }
                   .sheet(isPresented: $showModal, content: {
                       ModalView(showModal: $showModal, lightBulb: lightBulb)
                   })
                }.frame(width: 150)
                    .padding()
                    .foregroundColor(.blue)
                    .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.blue, lineWidth: 3))
            }
        }
}
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
