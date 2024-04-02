//
//  ItemDropSystem.swift
//  AFL2
//
//  Created by RabiRabi Channel on 02/04/24.
//

import Foundation


class RandomDropSystem {
    let enemyDrops: [EnemyDrop]

    init(enemyDrops: [EnemyDrop]) {
        self.enemyDrops = enemyDrops
    }

    func dropItem() -> EnemyDrop? {
        let randomNumber = Double.random(in: 0.0...1.0)
        var totalRate: Double = 0.0

        for enemyDrop in enemyDrops {
            totalRate += enemyDrop.dropRate
            if randomNumber <= totalRate {
                return enemyDrop
            }
        }

        return nil
    }
}
