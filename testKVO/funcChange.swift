//
//  funcChange.swift
//  testKVO
//
//  Created by zzw on 2016/10/14.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation

func incrementor(variable: Int) -> Int {
    return variable + 1
}

func incrementOne(variable: inout Int) {
     variable += 1
}


func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor( variable: inout Int) -> () {
        variable += addNumber;
    }
    return incrementor;
}
