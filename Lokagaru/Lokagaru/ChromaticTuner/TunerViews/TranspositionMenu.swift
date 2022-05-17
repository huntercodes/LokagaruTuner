//
//  TranspositionMenu.swift
//  Lokagaru
//
//  Created by hunter downey on 4/4/22.
//

import SwiftUI

struct TranspositionMenu: View {
    private let transpositions = ScaleNote.allCases.map(\.transpositionName)
    @Binding var selectedTransposition: Int

    var body: some View {
        Menu(
            content: {
                ForEach(0..<transpositions.count, id: \.self) { index in
                    Button(
                        action: {
                            selectedTransposition = index
                        },
                        label: {
                            Text(transpositions[index])
                        }
                    )
                }
            },
            label: {
                Text(transpositions[selectedTransposition])
                    // Increase tap area, some of the transpositions are just a single letter
                    // so the tap area can otherwise be quite small.
                    .font(Font.custom("Petahja-Regular", size: 28))
                    .frame(minWidth: 80)
                    .padding(14)
                    .foregroundColor(Color("mainColor1"))
                    .background(Ellipse()
                        .fill(Color("mainColor2"))
                        .frame(maxWidth: 175, maxHeight: 55)
                    )
                    .overlay(Ellipse()
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color("mainColor1"))
                        .frame(maxWidth: 175, maxHeight: 55)
                    )
            }
        )
        .transaction { transaction in
            // Disable animation when menu label changes width
            transaction.disablesAnimations = true
            transaction.animation = nil
        }
    }
}

private extension ScaleNote {
    var transpositionName: String {
        switch self {
        case .C:
            return "Concert Pitch"
        default:
            return names.joined(separator: " / ")
        }
    }
}

struct TranspositionMenu_Previews: PreviewProvider {
    static var previews: some View {
        TranspositionMenu(selectedTransposition: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}
