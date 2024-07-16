//
//  AnimationPleasantDark.swift
//  iAm
//
//  Created by Stanley Nicholas on 15/07/24.
//

import SwiftUI

struct AnimationPleasantDark: View {
    var body: some View {
        LottieView(animationFileName: "Pleasant-dark", loopMode: .loop)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    AnimationPleasantDark()
}
