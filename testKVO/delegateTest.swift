//
//  delegateTest.swift
//  testKVO
//
//  Created by zzw on 2016/10/25.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation

protocol testPro: class {
    func delegateMethod()
}

class delegateTest {
    weak var delegate: testPro?
    var num: Int?

    init() {
        num = 0
    }

    func method()  {
        if num == 10 {
            if delegate != nil {
                delegate?.delegateMethod()
            }
        }
    }

}
