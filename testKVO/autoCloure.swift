//
//  autoCloure.swift
//  testKVO
//
//  Created by zzw on 2016/10/14.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation

func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("True")
    }
}
