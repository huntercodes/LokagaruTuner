//
//  MatchedNoteFrequency.swift
//  Lokagaru
//
//  Created by hunter downey on 4/4/22.
//

import SwiftUI

struct MatchedNoteFrequency: View {
    let frequency: Frequency
    var body: some View {
        Text(frequency.localizedString())
            .font(.system(.title3, design: .serif))
            .foregroundColor(Color(hex: 0x417d7a))
    }
}

struct MatchedNoteFrequency_Previews: PreviewProvider {
    static var previews: some View {
        MatchedNoteFrequency(frequency: 440.0)
            .previewLayout(.sizeThatFits)
    }
}
