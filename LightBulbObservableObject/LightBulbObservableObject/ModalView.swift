//
//  ModalView.swift
//  LightBulbObservableObject
//
//  Created by Stefania Zinno for the Developer Academy on 12/10/21.
//
//


import SwiftUI

struct ModalView: View {
    @Binding var showModal: Bool
    @ObservedObject var lightBulb: LightBulb
    
    var body: some View {
        NavigationView {
            Group{
                VStack{
                    Image(systemName: "lightbulb.fill").foregroundColor(.yellow)
                        .opacity(lightBulb.intensity)
                    .foregroundColor(.green)
                        .padding(20)
                        .font(.system(size: 60))
                    Slider(value: $lightBulb.intensity, in: 0.1...0.9)
               .frame(width: 150)
                .padding(5)
                .navigationBarItems(trailing: Button("Done", action: {
                    showModal.toggle()
                })).foregroundColor(.none)
                }
            }
        }
    }
    
}



struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(showModal: .constant(true), lightBulb: LightBulb(color: .yellow, intensity: 1))
    }
}
