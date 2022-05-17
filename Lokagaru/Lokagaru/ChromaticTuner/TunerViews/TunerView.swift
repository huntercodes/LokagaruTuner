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
        
        coloredAppearance.backgroundColor = UIColor(Color("navBarColor"))
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("mainColor1")), .font: UIFont(name: "Petahja-Regular", size: 30)!]
        UINavigationBar.appearance().tintColor = UIColor(Color("mainColor1"))
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(
                    colors: [Color("backgroundColor"), Color("mainColor2")]),
                    startPoint: .top, endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(alignment: .noteCenter) {
                    HStack {
                        TranspositionMenu(selectedTransposition: $selectedTransposition)
                            .padding()
                        
                        Spacer()
                    }

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
                .navigationTitle("Lokagaru")
                .navigationBarTitleDisplayMode(.inline)
                .alert(isPresented: $tunerController.showMicrophoneAccessAlert) {
                    Alert(
                        title: Text("No microphone access"),
                        message: Text(
                            """
                            Please grant microphone access in the Settings app in the "Privacy ⇾ Microphone" section.
                           """
                        )
                    )
                }
            }
        }
    }

}

struct TunerView_Previews: PreviewProvider {
    static var previews: some View {
        TunerView()
            .preferredColorScheme(.dark)
            
            
            
            
    }
}
