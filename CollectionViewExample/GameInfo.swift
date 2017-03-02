//
//  GameInfo.swift
//  CollectionViewExample
//
//  Created by Daniel Asher on 02/03/2017.
//  Copyright © 2017 LEXI LABS. All rights reserved.
//
import RxSwift

let games1 = ["😀 Pairs Game", "🙉 Whack a mole", "😀 Pairs Game"]
    .enumerated().map { GameInfo($1, $0) }

let items1 = Observable.just(games1)

let games2 = ["😀 Best Game", "🙉 Word Search", "😀 Fun Game"]
    .enumerated().map { GameInfo($1, $0) }
let items2 = Observable.just(games2)

struct GameInfo {
    let title : String
    let number : Int
    init(_ title: String, _ number: Int) {
        self.title = title
        self.number = number
    }
}
