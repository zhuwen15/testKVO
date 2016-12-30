//
//  retainCycle.swift
//  testKVO
//
//  Created by zzw on 2016/10/24.
//  Copyright © 2016年 zzw. All rights reserved.
//

import UIKit

class A {
    let b: B
    init() {
        b = B()
        b.a = self }
    deinit {
        print("A deinit")
    }
}

class B {
    weak var a: A? = nil
    deinit {
        print("B deinit")
    }
}


class PersonAgain {
    let name: String
    lazy var printName: ()->() = {[weak self] in

        /// weak 方案
        if let strongSelf = self {
            print("The name is \(strongSelf.name)")
        }

   }
   lazy var printNameAgain: ()->() = {[unowned self] in
            print("The name is \(self.name)")
    }

    init(personName: String) {
    name = personName
    }
    deinit {
        print("Person deinit \(self.name)")
    } }

func loadBigData() {
    if let path = Bundle.main
        .path(forResource: "123", ofType: "png") {
        for _ in 1...10000 {
            autoreleasepool {
                _ = NSData.init(contentsOfFile: path)
                //dataWithContentsOfFile(
               //     path, options: nil, error: nil)
                Thread.sleep(forTimeInterval: 0.5)
            }
        }
    }
}
