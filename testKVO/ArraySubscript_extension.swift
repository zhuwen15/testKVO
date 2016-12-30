//
//  File.swift
//  testKVO
//
//  Created by zzw on 2016/10/17.
//  Copyright © 2016年 zzw. All rights reserved.
//

// MARK: - hard
import Foundation

extension Array {

    subscript(input: [Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            return result
        }
        set {
            for (index,i) in input.enumerated() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }

}
