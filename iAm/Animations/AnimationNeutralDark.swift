//
//  AnimationNeutralDark.swift
//  iAm
//
//  Created by Stanley Nicholas on 15/07/24.
//

import SwiftUI

struct AnimationNeutralDark: View {
    var body: some View {
        LottieView(animationFileName: "Neutral-dark", loopMode: .loop)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    AnimationNeutralDark()
}
