//
//  AnimationPleasant.swift
//  iAm
//
//  Created by Stanley Nicholas on 11/07/24.
//

import SwiftUI

struct AnimationPleasant: View {
    var body: some View {
        LottieView(animationFileName: "Pleasant", loopMode: .loop)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    AnimationPleasant()
}
