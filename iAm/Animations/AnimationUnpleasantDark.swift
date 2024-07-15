//
//  AnimationUnpleasantDark.swift
//  iAm
//
//  Created by Stanley Nicholas on 15/07/24.
//

import SwiftUI

struct AnimationUnpleasantDark: View {
    var body: some View {
        LottieView(animationFileName: "Unpleasant-dark", loopMode: .loop)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    AnimationUnpleasantDark()
}
