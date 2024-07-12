//
//  ContentView.swift
//  nanoChallenge 3
//
//  Created by Ferris Leroy Winata on 09/07/24.
//

import SwiftUI

struct StateOfMindPage: View {
    @State private var showNotePage = false
    @State private var buttonColor: [Color] = [.unpleasant,.slightlyUnpleasant,.neutral,.slightlyPleasant, .pleasant]
    @State private var selectedIndex: Int = 0
    @State var selectedStateOfMind: StateOfMindModel = MockData.stateOfMinds[0]
    
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $selectedIndex) {
                    ForEach(Array(MockData.stateOfMinds.enumerated()), id: \.offset) { index, state in
                        StateOfMindCard(
                            imageName: state.imageName,
                            name: state.name
                        )
                        .opacity(index == selectedIndex ? 1.5 : 0.3)
                    }
                    .padding(.top, 100)
                }
                .padding(.bottom, -40)
                .tabViewStyle(.page(indexDisplayMode:.always))
                .indexViewStyle(.page(backgroundDisplayMode:.always))
                
                NavigationLink(destination: NotePage(selectedStateOfMind: selectedStateOfMind), isActive: $showNotePage) {
                    Button(action: {
                        showNotePage = true
                        
                        selectedStateOfMind = MockData.stateOfMinds[selectedIndex]
                        
                    }) {
                        Text("Write")
                            .frame(width: 50, height: 18)
                            .padding()
                            .background(buttonColor[selectedIndex])
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding([.top, .bottom], 120)
            }
        }
    }
}

struct StateOfMindCard: View {
    
    var imageName: String
    var name: String
    
    var body: some View {
        VStack (spacing: 40){
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Text(name)
                .font(.title)
            
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    StateOfMindPage(selectedStateOfMind: MockData.stateOfMinds[0])
}
