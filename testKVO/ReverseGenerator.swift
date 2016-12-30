//
//  ReverseGenerator.swift
//  testKVO
//
//  Created by zzw on 16/10/13.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation


class ReverseGenerator: IteratorProtocol {
    typealias Element = Int
    var counter: Element

    init<T>(array: [T]) {
        self.counter = array.count - 1
    }
    init(start: Int) {
        self.counter = start
    }
    func next() -> Element? {
        if self.counter < 0{
            return nil
        }
        let ret = counter
        counter -= 1
        return ret
    }
}



struct ReverseSequence<T>: Sequence {
    var array: [T]
    init (array: [T]) {
        self.array = array
    }
    typealias Generator = ReverseGenerator
    func makeIterator() -> Generator {
        return ReverseGenerator(array: array)
    }
}


