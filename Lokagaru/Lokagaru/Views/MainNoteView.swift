//
//  MainNoteView.swift
//  Lokagaru
//
//  Created by hunter downey on 4/4/22.
//

import SwiftUI

struct MainNoteView: View {
    let note: String
    var body: some View {
        Text(note)
            .font(.system(size: 180, design: .serif))
            .bold()
            .alignmentGuide(.noteCenter) { dimensions in
                dimensions[HorizontalAlignment.center]
            }
    }
}

struct MainNoteView_Previews: PreviewProvider {
    static var previews: some View {
        MainNoteView(note: "A")
            .previewLayout(.sizeThatFits)
    }
}
