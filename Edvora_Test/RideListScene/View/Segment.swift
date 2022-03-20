//
//  Segment.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 20/03/22.
//

import SwiftUI

struct Segment: View {
    var model: SegmentViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(model.titleAndCount)
                .font(.system(size: 12))
                .foregroundColor(.black)
            Spacer()
            VStack {
                if model.isSelected {
                    Color.blue.frame(height:CGFloat(4) / UIScreen.main.scale)
                }else {
                    Color.clear.frame(height:CGFloat(4) / UIScreen.main.scale)
                }
            }
        }
    }
}

