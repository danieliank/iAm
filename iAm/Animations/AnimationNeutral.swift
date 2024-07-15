//
//  AnimationNeutral.swift
//  iAm
//
//  Created by Stanley Nicholas on 11/07/24.
//

import SwiftUI

struct AnimationNeutral: View {
    var body: some View {
        LottieView(animationFileName: "Neutral", loopMode: .loop)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    AnimationNeutral()
}
