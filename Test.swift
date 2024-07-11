//
//  Test.swift
//  nanoChallenge 3
//
//  Created by Ferris Leroy Winata on 10/07/24.
//

import SwiftUI

struct Test: View {
    @State private var currentPage: Int = 0
    private var previousPage: Int = 0
    
    var body: some View {
        VStack {
            Text("Current Page: \(currentPage)")
                .font(.largeTitle)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<5) { index in
                        GeometryReader { geometry in
                            Color.blue
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Text("Page \(index)")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                )
                                .scrollTargetLayout()
                                .scrollTargetBehavior(.paging)
                                .onChange(of: geometry.frame(in: .global).minX) { newValue in
                                    let offset = geometry.frame(in: .global).minX
                                    let newPage = Int(round(offset / UIScreen.main.bounds.width))
                                    if newPage != self.currentPage {
                                        DispatchQueue.main.async {
                                            self.currentPage = newPage
                                            print("Page changed to: \(newPage)")
                                        }
                                    }
                                }
                        }
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        
                    }
                }
            }
            
            StateOfMindPageIndicatorTest(numberOfPages: MockData.stateOfMinds.count, currentPage: $currentPage)
        }
        .onAppear {
            UIScrollView.appearance().isPagingEnabled = true
        }
    }
    
    func getCurrentPage(){
        
    }
}

struct StateOfMindPageIndicatorTest: View {
    let numberOfPages : Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages) { index in
                return Circle()
                    .frame(width: 8, height: 8)
                    .opacity(Double(index == currentPage ? 1 : 0.3))
            }
        }
    }
}





#Preview {
    Test()
}
