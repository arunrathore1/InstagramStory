//
//  HomeView.swift
//  InstagramStory
//
//  Created by Arun Rathore on 01/03/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var storyTimer: StoryTimer = StoryTimer(items: 5, interval: 3.0)
    var imageNames:[String] = ["Image1","Image3","Image2","Image1","Image2","Image3"]

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image(self.imageNames[Int(self.storyTimer.progress)])
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: nil, alignment: .center)
                HStack(alignment: .center, spacing: 4) {
                    ForEach(self.imageNames.indices, id: \.self) { index in
                        LoadingRectangleView(progress: min( max( (CGFloat(self.storyTimer.progress) - CGFloat(index)), 0.0) , 1.0) )
                            .frame(width: nil, height: 2, alignment: .leading)
                            .animation(.linear)
                    }
                }.padding()
            }.onAppear {
                self.storyTimer.start()
            }
        }
    }
}
