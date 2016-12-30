//
//  MyNamespace.swift
//  testKVO
//
//  Created by zzw on 2016/10/17.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation

struct MyClassContainer1 {
    class MyClass {
        class func hello() {
            print("hello from MyClassContainer1")
        }
    }
}

struct MyClassContainer2 {
    class MyClass {
        static func hello() {
            print("hello from MyClassContainer2")
        }
    }
}
