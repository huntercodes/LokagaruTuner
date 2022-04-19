//
//  ContentView.swift
//  Lokagaru
//
//  Created by hunter downey on 3/21/22.
//

import SwiftUI

struct TunerView: View {
    @ObservedObject private var tunerController = TunerController()
    @AppStorage("modifierPreference") private var modifierPreference = ModifierPreference.preferSharps
    @AppStorage("selectedTransposition") private var selectedTransposition = 0

    private var tunerData: TunerData { tunerController.data }
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        
        coloredAppearance.backgroundColor = UIColor(red: 65/255, green: 125/255, blue: 122/255, alpha: 1.0)
        coloredAppearance.titleTextAttributes = [ .foregroundColor: UIColor(red: 237/255, green: 230/255, blue: 219/255, alpha: 1.0), .font: UIFont(name: "GillSans-SemiBold", size: 22)!]
        UINavigationBar.appearance().tintColor = UIColor(red: 237/255, green: 230/255, blue: 219/255, alpha: 1.0)
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    var body: some View {
        VStack(alignment: .noteCenter) {
            HStack {
                TranspositionMenu(selectedTransposition: $selectedTransposition)
                    .padding()

                Spacer()
            }
            
            Spacer()

            MatchedNoteView(
                match: tunerData.closestNote.inTransposition(ScaleNote.allCases[selectedTransposition]),
                modifierPreference: modifierPreference
            )
            .onTapGesture {
                modifierPreference = modifierPreference.toggled
            }

            MatchedNoteFrequency(frequency: tunerData.closestNote.frequency)

            NoteDistanceMarkers()
                .overlay(
                    CurrentNoteMarker(
                        frequency: tunerData.pitch,
                        distance: tunerData.closestNote.distance
                    )
                )

            Spacer()
        }
        .onAppear(perform: tunerController.start)
        .onDisappear(perform: tunerController.stop)
        .alert(isPresented: $tunerController.showMicrophoneAccessAlert) {
            Alert(
                title: Text("No microphone access"),
                message: Text(
                    """
                    Please grant microphone access in the Settings app in the "Privacy ⇾ Microphone" section.
                    """)
            )
        }
    }
}

struct TunerView_Previews: PreviewProvider {
    static var previews: some View {
        TunerView()
    }
}
