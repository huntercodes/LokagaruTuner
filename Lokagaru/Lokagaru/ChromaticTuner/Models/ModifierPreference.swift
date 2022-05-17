//
//  ModifierPreference.swift
//  Lokagaru
//
//  Created by hunter downey on 4/4/22.
//

enum ModifierPreference: Int, Identifiable, CaseIterable {
    case preferSharps, preferFlats

    var toggled: ModifierPreference {
        switch self {
        case .preferSharps:
            return .preferFlats
        case .preferFlats:
            return .preferSharps
        }
    }

    var id: Int { rawValue }
}
