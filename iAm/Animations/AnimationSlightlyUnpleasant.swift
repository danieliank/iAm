//
//  AnimationSlightlyUnpleasant.swift
//  iAm
//
//  Created by Stanley Nicholas on 10/07/24.
//

import SwiftUI

struct AnimationSlightlyUnpleasant: View {
    var body: some View {
        LottieView(animationFileName: "Slightly Unpleasant", loopMode: .loop)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    AnimationSlightlyUnpleasant()
}
