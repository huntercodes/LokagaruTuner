//
//  Alignment.swift
//  Lokagaru
//
//  Created by hunter downey on 4/4/22.
//

import SwiftUI

extension HorizontalAlignment {
    enum NoteCenter: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }

    static let noteCenter = HorizontalAlignment(NoteCenter.self)
}
