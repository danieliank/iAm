//
//  Navbar.swift
//  iAm
//
//  Created by Raphael on 10/07/24.
//

import SwiftUI

struct Navbar: View {
    var body: some View {
        NavigationStack {
            Text("content") //content goes here gw blm tau cara gantinya gmn uwu
                .toolbar {
                    ToolbarItem (placement: .topBarLeading) {
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "chevron.left").fontWeight(.medium)
                            Text("Notes")
                        })
                        .foregroundStyle(.mint)
                    }
                    ToolbarItem (placement: .principal) {
                        Text("MON 8 · 11.53").fontWeight(.medium)
                    }
                    ToolbarItem (placement: .topBarTrailing) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                                        Image(systemName: "ellipsis.circle").fontWeight(.medium)
                                                    })
                                                    .foregroundStyle(.mint)
                    }
                            
                            
                    
                    }
                
        }
    }
}

#Preview {
    Navbar()
}
