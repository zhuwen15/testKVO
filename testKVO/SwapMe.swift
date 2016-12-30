
//
//  SwapMe.swift
//  testKVO
//
//  Created by zzw on 2016/10/14.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation

class swapMe: NSObject {

    func swapMe<T>( a: inout T, b: inout T) {
        (a,b) = (b,a)
    }

}
