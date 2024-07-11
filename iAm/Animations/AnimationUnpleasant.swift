//
//  AnimationUnpleasant.swift
//  iAm
//
//  Created by Stanley Nicholas on 10/07/24.
//

import SwiftUI

struct AnimationUnpleasant: View {
    var body: some View {
        LottieView(animationFileName: "Unpleasant", loopMode: .loop)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    AnimationUnpleasant()
}
