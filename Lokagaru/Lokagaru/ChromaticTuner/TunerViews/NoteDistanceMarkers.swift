//
//  NoteDistanceMarkers.swift
//  Lokagaru
//
//  Created by hunter downey on 4/4/22.
//

import SwiftUI

struct NoteDistanceMarkers: View {
    var body: some View {
        HStack {
            ForEach(0..<25) { index in
                Rectangle()
                    .frame(width: 2, height: tickSize(forIndex: index).height)
                    .cornerRadius(6)
                    .foregroundColor(Color("mainColor1"))
                    .inExpandingRectangle()
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    private func tickSize(forIndex index: Int) -> NoteTickSize {
        if index == 12 {
            return .large
        } else if [2, 7, 17, 22].contains(index) {
            return .medium
        } else {
            return .small
        }
    }
}

enum NoteTickSize {
    case small, medium, large

    var height: CGFloat {
        switch self {
        case .small:
            return 60
        case .medium:
            return 100
        case .large:
            return 180
        }
    }
}

extension View {
    func inExpandingRectangle() -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
            self
        }
    }
}

struct NoteDistanceMarkers_Previews: PreviewProvider {
    static var previews: some View {
        NoteDistanceMarkers()
            .previewLayout(.sizeThatFits)
    }
}
