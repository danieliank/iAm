//
//  AnimationSlightlyPleasant.swift
//  iAm
//
//  Created by Stanley Nicholas on 11/07/24.
//

import SwiftUI

struct AnimationSlightlyPleasant: View {
    var body: some View {
        LottieView(animationFileName: "SlightlyPleasant", loopMode: .loop)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    AnimationSlightlyPleasant()
}
