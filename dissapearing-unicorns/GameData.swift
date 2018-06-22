//
//  GameData.swift
//  dissapearing-unicorns
//
//  Created by Vojtěch Pavelka on 22.06.18.
//  Copyright © 2018 Vojtěch Pavelka. All rights reserved.
//

import Foundation

internal class GameData : NSObject {
    internal func savePoints(_ points: Int, for name: String)
    internal func playerData(forRank rank: Int) -> PlayerData
    internal var numberOfPlayers: Int { get }
}
