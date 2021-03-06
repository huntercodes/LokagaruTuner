//
//  CurrentNoteMarker.swift
//  Lokagaru
//
//  Created by hunter downey on 4/4/22.
//

import SwiftUI

struct CurrentNoteMarker: View {
    let frequency: Frequency
    let distance: Frequency.MusicalDistance
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Rectangle()
                    .frame(width: 2, height: NoteTickSize.large.height)
                    .cornerRadius(6)
                    .foregroundColor(distance.color)
                Text(frequency.localizedString())
                    //.font(.system(.subheadline, design: .monospaced))
                    .font(Font.custom("Petahja-Regular", size: 20))
                    .foregroundColor(Color("mainColor1"))
            }
            .frame(width: geometry.size.width)
            .offset(
                x: (geometry.size.width / 2) * CGFloat(distance.cents / 50)
            )
        }
    }
}

struct CurrentNoteMarker_Previews: PreviewProvider {
    static var previews: some View {
        CurrentNoteMarker(frequency: 440.0, distance: 0)
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
