//
//  LoadingRectangleView.swift
//  InstagramStory
//
//  Created by Arun Rathore on 01/03/24.
//

import SwiftUI

struct LoadingRectangleView: View {
    var progress: CGFloat
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.3))
                    .cornerRadius(5)
                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: nil, alignment: .leading)
                    .foregroundColor(Color.white.opacity(0.3))
                    .cornerRadius(5)

            }
        }
    }
}
